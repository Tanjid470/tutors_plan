import 'package:flutter/material.dart';

class LiveClassesPage extends StatelessWidget {
  const LiveClassesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Upcoming Classes', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Column(
              spacing: 10,
              children: [
                classCard(
                  title: 'Advanced JavaScript',
                  date: '2024-03-20',
                  time: '10:00 AM - 11:30 AM',
                  participants: 24,
                  isUpcoming: true,
                ),
                classCard(
                  title: 'React Fundamentals',
                  date: '2024-03-20',
                  time: '2:00 PM - 3:30 PM',
                  participants: 18,
                  isUpcoming: true,
                ),
                classCard(
                  title: 'Data Structures',
                  date: '2024-03-21',
                  time: '11:00 AM - 12:30 PM',
                  participants: 30,
                  isUpcoming: true,
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text('Past Classes', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Column(
              spacing: 10,
              children: [
                classCard(
                  title: 'Introduction to Python',
                  date: '2024-03-19',
                  time: '9:00 AM - 10:30 AM',
                  participants: 22,
                  isUpcoming: false,
                ),
                classCard(
                  title: 'Database Design',
                  date: '2024-03-18',
                  time: '3:00 PM - 4:30 PM',
                  participants: 26,
                  isUpcoming: false,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget classCard({
    required String title,
    required String date,
    required String time,
    required int participants,
    required bool isUpcoming,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 1,
          color: Colors.grey
        ),
        color: Colors.white,

      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: isUpcoming ? Colors.grey[300] : Colors.green[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    isUpcoming ? 'Upcoming' : 'Completed',
                    style: const TextStyle(fontSize: 12),
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),
            Row(
              spacing: 7,
              children: [
                Icon(Icons.date_range,size: 15),
                Text(date),
              ],
            ),
            Row(
              spacing: 7,
              children: [
                Icon(Icons.access_time_rounded,size: 15),
                Text(time),
              ],
            ),
            Row(
              spacing: 7,
              children: [
                Icon(Icons.groups,size: 15),
                Text("$participants participants"),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: isUpcoming ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: isUpcoming
                    ? null
                    : Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  // Handle tap
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Center(
                    child: Text(
                      isUpcoming ? 'Join Class' : 'Watch Recording',
                      style: TextStyle(
                        color: isUpcoming ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
