import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCourseView extends StatelessWidget {
  const MyCourseView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> courses = [
      {
        'title': 'Flutter Development',
        'instructor': 'Tanjid Hossain Amran',
        'progress': 0.7,
      },
      {
        'title': 'Data Structures',
        'instructor': 'John Doe',
        'progress': 0.45,
      },
      {
        'title': 'UI/UX Basics',
        'instructor': 'Jane Smith',
        'progress': 0.2,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Courses'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: courses.length,
        itemBuilder: (_, index) {
          final course = courses[index];
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(course['title'], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text('Instructor: ${course['instructor']}', style: TextStyle(color: Colors.grey[600])),
                  const SizedBox(height: 12),
                  LinearProgressIndicator(
                    value: course['progress'],
                    backgroundColor: Colors.grey[300],
                    color: Colors.blue,
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.snackbar('Continue', 'Resuming ${course['title']}...');
                      },
                      child: const Text('Continue'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
