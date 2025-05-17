import 'package:flutter/material.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:googleapis/calendar/v3.dart' as calendar;
import 'package:url_launcher/url_launcher.dart';

class GoogleMeetCreator extends StatefulWidget {
  const GoogleMeetCreator({super.key});

  @override
  State<GoogleMeetCreator> createState() => _GoogleMeetCreatorState();
}

class _GoogleMeetCreatorState extends State<GoogleMeetCreator> {
  String? meetUrl;
  bool loading = false;

  final clientId = ClientId(
    '140764356011-f6ig7j8f95n5nj2qirc6g5stfkgvj4od.apps.googleusercontent.com',
    null, // no client secret for mobile apps
  );

  final scopes = ['https://www.googleapis.com/auth/calendar.events'];

  Future<void> createGoogleMeet() async {
    setState(() => loading = true);

    try {
      final authClient = await clientViaUserConsent(clientId, scopes, (url) async {
        await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
      });

      final calendarApi = calendar.CalendarApi(authClient);

      final event = calendar.Event()
        ..summary = 'Meeting from Flutter App'
        ..start = calendar.EventDateTime(
          dateTime: DateTime.now().toUtc(),
          timeZone: 'UTC',
        )
        ..end = calendar.EventDateTime(
          dateTime: DateTime.now().add(const Duration(minutes: 30)).toUtc(),
          timeZone: 'UTC',
        )
        ..conferenceData = calendar.ConferenceData(
          createRequest: calendar.CreateConferenceRequest(
            requestId: DateTime.now().millisecondsSinceEpoch.toString(),
            conferenceSolutionKey: calendar.ConferenceSolutionKey(type: 'hangoutsMeet'),
          ),
        );

      final createdEvent = await calendarApi.events.insert(
        event,
        'primary',
        conferenceDataVersion: 1,
      );

      setState(() {
        meetUrl = createdEvent.conferenceData?.entryPoints?.first.uri;
      });

      if (meetUrl != null) {
        await launchUrl(Uri.parse(meetUrl!), mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      print("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
    } finally {
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Google Meet Creator')),
      body: Center(
        child: loading
            ? const CircularProgressIndicator()
            : ElevatedButton(
          onPressed: createGoogleMeet,
          child: const Text('Create Google Meet'),
        ),
      ),
    );
  }
}
