import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

final class PaymentWebView extends StatefulWidget {
  final String name;
  final String url;
  const PaymentWebView({super.key, required this.name, required this.url});

  @override
  State<PaymentWebView> createState() => _PaymentWebViewState();
}

class _PaymentWebViewState extends State<PaymentWebView> {
  final RxBool isLoading = true.obs;
  late final WebViewController webviewController;

  @override
  void initState() {
    super.initState();

    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final controller = WebViewController.fromPlatformCreationParams(params);

    controller
      ..setUserAgent("random")
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.transparent)
      ..setNavigationDelegate(
        NavigationDelegate(
          onHttpAuthRequest: (request) {
            //log(request.toString());
          },
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            isLoading.value = true;
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            isLoading.value = false;
            debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
                        Page resource error:
                        code: ${error.errorCode}
                        description: ${error.description}
                        errorType: ${error.errorType}
                        isForMainFrame: ${error.isForMainFrame}
                    ''');
          },
          onNavigationRequest: (NavigationRequest action) async {
            if (action.url.endsWith('success')) {
              SmartDialog.showToast('Payment Successfully');
              Future.delayed(const Duration(seconds: 3)).then(
                (value) {
                  Navigator.pop(context);
                },
              );
            } else if (action.url.endsWith('cancel')) {
              SmartDialog.showToast('Payment Failed');
              Future.delayed(const Duration(seconds: 2)).then(
                (value) {
                  Navigator.pop(context);
                },
              );
            }

            debugPrint('allowing navigation to ${action.url}');
            return NavigationDecision.navigate;
          },
          onUrlChange: (UrlChange change) {
            debugPrint('url change to ${change.url}');
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));

    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }

    webviewController = controller;
  }

  @override
  void dispose() {
    if (Platform.isIOS) {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ));
    } else {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ));
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(statusBarColor: Colors.white),
      child: Scaffold(
        appBar: CustomAppbar(name: widget.name),
        body: Obx(() {
          return isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : WebViewWidget(controller: webviewController);
        }),
      ),
    );
  }
}

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String name;
  const CustomAppbar({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 75,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => Get.back(),
                child: const Icon(Icons.arrow_back_ios, color: Colors.black),
              ),
              const SizedBox(width: 10),
              Text(
                name.tr,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(75);
}
