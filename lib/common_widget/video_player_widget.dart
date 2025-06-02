import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class CustomVideoPlayer extends StatefulWidget {
  final String videoUrl;

  const CustomVideoPlayer({required this.videoUrl, Key? key}) : super(key: key);

  @override
  _CustomVideoPlayerState createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  bool _showLoader = false;
  bool _isSeeking = false;
  bool _isUserSeeking = false;
  bool _playbackChangeInProgress = false;
  bool isFullscreenToggling = false;
  Timer? _seekDebouncer;
  DateTime? _lastSeekTime;
  DateTime? _lastPlaybackChangeTime;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        setState(() {});
      });

    _videoPlayerController.addListener(_videoListener);

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: false,
      looping: false,
      showControlsOnInitialize: false,
      customControls: CustomControls(
        onSeekStart: _onSeekStart,
        onSeekEnd: _onSeekEnd,
        onPlaybackChange: _onPlaybackChange,
        onFullscreenToggle: _onFullscreenToggle,
      ),
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.red,
        handleColor: Colors.redAccent,
        backgroundColor: Colors.grey,
        bufferedColor: Colors.lightGreen,
      ),
    );
  }

  void _onPlaybackChange(bool isPlaying) {
    _playbackChangeInProgress = true;
    _lastPlaybackChangeTime = DateTime.now();

    _seekDebouncer?.cancel();
    _seekDebouncer = Timer(const Duration(milliseconds: 1500), () {
      if (mounted) {
        _playbackChangeInProgress = false;
      }
    });
  }

  void _onSeekStart() {
    _isUserSeeking = true;
    _isSeeking = true;
    _lastSeekTime = DateTime.now();
    _seekDebouncer?.cancel();
  }

  void _onSeekEnd() {
    _lastSeekTime = DateTime.now();
    _seekDebouncer?.cancel();
    _seekDebouncer = Timer(const Duration(milliseconds: 1000), () {
      if (mounted) {
        _isSeeking = false;
        _isUserSeeking = false;
      }
    });
  }

  void _onFullscreenToggle(bool isToggling) {
    isFullscreenToggling = isToggling;

    if (isToggling) {
      _seekDebouncer?.cancel();
      setState(() {
        _showLoader = false;
      });
    }
  }

  void _videoListener() {
    if (!mounted) return;

    final isBuffering = _videoPlayerController.value.isBuffering;

    final suppressLoader = _isUserSeeking ||
        _isSeeking ||
        _playbackChangeInProgress ||
        (_lastSeekTime != null && DateTime.now().difference(_lastSeekTime!).inMilliseconds < 1500) ||
        (_lastPlaybackChangeTime != null && DateTime.now().difference(_lastPlaybackChangeTime!).inMilliseconds < 1500);

    if (suppressLoader) {
      if (_showLoader) {
        setState(() {
          _showLoader = false;
        });
      }
      return;
    }

    if (isBuffering != _showLoader) {
      if (isBuffering) {
        _seekDebouncer?.cancel();
        _seekDebouncer = Timer(const Duration(milliseconds: 300), () {
          if (mounted && !_isUserSeeking && !_playbackChangeInProgress) {
            setState(() {
              _showLoader = true;
            });
          }
        });
      } else {
        _seekDebouncer?.cancel();
        setState(() {
          _showLoader = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _seekDebouncer?.cancel();
    _videoPlayerController.removeListener(_videoListener);
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _videoPlayerController.value.isInitialized
        ? Stack(
            alignment: Alignment.center,
            children: [
              AspectRatio(
                aspectRatio: _videoPlayerController.value.aspectRatio,
                child: Chewie(controller: _chewieController!),
              ),
              // if (_showLoader &&
              //     !_isUserSeeking &&
              //     !_playbackChangeInProgress &&
              //     (_lastSeekTime == null || DateTime.now().difference(_lastSeekTime!).inMilliseconds > 1500) &&
              //     (_lastPlaybackChangeTime == null || DateTime.now().difference(_lastPlaybackChangeTime!).inMilliseconds > 1500))
              if (_showLoader)
                Positioned.fill(
                  child: Container(
                    color: Colors.black,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
            ],
          )
        : const Center(child: CircularProgressIndicator());
  }
}

class CustomControls extends StatefulWidget {
  final VoidCallback onSeekStart;
  final VoidCallback onSeekEnd;
  final Function(bool isPlaying) onPlaybackChange;
  final Function(bool isToggling)? onFullscreenToggle;

  const CustomControls({
    required this.onSeekStart,
    required this.onSeekEnd,
    required this.onPlaybackChange,
    this.onFullscreenToggle,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomControls> createState() => _CustomControlsState();
}

class _CustomControlsState extends State<CustomControls> {
  late VideoPlayerController _controller;
  DateTime? lastUserInteraction;

  void _markUserInteraction() {
    lastUserInteraction = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    final chewieController = ChewieController.of(context);
    _controller = chewieController.videoPlayerController;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Listener(
          onPointerDown: (_) {
            _markUserInteraction();
            widget.onSeekStart();
          },
          onPointerUp: (_) {
            _markUserInteraction();
            Future.delayed(const Duration(milliseconds: 300), () {
              if (mounted) widget.onSeekEnd();
            });
          },
          child: VideoProgressIndicator(
            _controller,
            allowScrubbing: true,
            colors: const VideoProgressColors(
              playedColor: Colors.red,
              bufferedColor: Colors.grey,
              backgroundColor: Colors.black26,
            ),
            padding: const EdgeInsets.only(bottom: 8),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.replay_10, color: Colors.white, size: 36),
              onPressed: () async {
                _markUserInteraction();
                widget.onSeekStart();
                final pos = await _controller.position;
                final newPosition = (pos ?? Duration.zero) - const Duration(seconds: 10);
                await _controller.seekTo(newPosition < Duration.zero ? Duration.zero : newPosition);
                if (mounted) widget.onSeekEnd();
              },
            ),
            IconButton(
              icon: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow, color: Colors.white, size: 40),
              onPressed: () async {
                _markUserInteraction();
                widget.onPlaybackChange(!_controller.value.isPlaying);
                if (_controller.value.isPlaying) {
                  await _controller.pause();
                } else {
                  await _controller.play();
                }
                setState(() {});
              },
            ),
            IconButton(
              icon: const Icon(Icons.forward_10, color: Colors.white, size: 36),
              onPressed: () async {
                _markUserInteraction();
                widget.onSeekStart();
                final pos = await _controller.position;
                final newPosition = (pos ?? Duration.zero) + const Duration(seconds: 10);
                await _controller.seekTo(newPosition);
                if (mounted) widget.onSeekEnd();
              },
            ),
            IconButton(
              icon: Icon(
                _controller.value.volume == 0 ? Icons.volume_off : Icons.volume_up,
                color: Colors.white,
              ),
              onPressed: () {
                _markUserInteraction();
                setState(() {
                  final newVol = _controller.value.volume == 0 ? 1.0 : 0.0;
                  _controller.setVolume(newVol);
                });
              },
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.fullscreen, color: Colors.white),
              onPressed: () {
                _markUserInteraction();
                widget.onPlaybackChange(!_controller.value.isPlaying);
                widget.onFullscreenToggle?.call(true);
                chewieController.enterFullScreen();
                Future.delayed(const Duration(milliseconds: 1000), () {
                  widget.onFullscreenToggle?.call(false);
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
