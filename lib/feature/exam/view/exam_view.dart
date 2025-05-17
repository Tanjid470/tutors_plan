import 'package:flutter/material.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/const/text_style.dart';

class ExamView extends StatelessWidget {
  ExamView({super.key});

  final List<Map<String, dynamic>> quizzes = [
    {
      'title': 'JavaScript Fundamentals',
      'subtitle': 'Full Stack Development',
      'duration': '45 minutes',
      'questions': 20,
      'score': null,
      'completed': false,
    },
    {
      'title': 'Design Principles',
      'subtitle': 'UI/UX Design Principles',
      'duration': '30 minutes',
      'questions': 15,
      'score': '85%',
      'completed': false,
    },
    {
      'title': 'Cloud Services',
      'subtitle': 'Cloud Computing Basics',
      'duration': '60 minutes',
      'questions': 25,
      'score': '78%',
      'completed': false,
    },
    {
      'title': 'Database Essentials',
      'subtitle': 'SQL and NoSQL Databases',
      'duration': '40 minutes',
      'questions': 18,
      'score': null,
      'completed': true,
    },
    {
      'title': 'Git & GitHub',
      'subtitle': 'Version Control Systems',
      'duration': '35 minutes',
      'questions': 15,
      'score': '92%',
      'completed': true,
    },
    {
      'title': 'Networking Basics',
      'subtitle': 'Computer Networks Overview',
      'duration': '50 minutes',
      'questions': 22,
      'score': '80%',
      'completed': true,
    },
    {
      'title': 'Data Structures',
      'subtitle': 'Foundational Programming Concepts',
      'duration': '55 minutes',
      'questions': 20,
      'score': '100',
      'completed': true,
    },
    {
      'title': 'APIs & REST',
      'subtitle': 'Building & Consuming APIs',
      'duration': '40 minutes',
      'questions': 17,
      'score': '88%',
      'completed': true,
    },
    {
      'title': 'Security Basics',
      'subtitle': 'Web Security Fundamentals',
      'duration': '30 minutes',
      'questions': 14,
      'score': null,
      'completed': true,
    },
    {
      'title': 'Agile Methodologies',
      'subtitle': 'Software Development Life Cycle',
      'duration': '45 minutes',
      'questions': 19,
      'score': '90%',
      'completed': true,
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16,right: 16,top: 40),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: quizzes.map((quiz) => _buildQuizCard(context, quiz)).toList(),
        ),
      ),
    );
  }

  Widget _buildQuizCard(BuildContext context, Map<String, dynamic> quiz) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  quiz['title'],
                  style: customTextStyle(context,
                      fontSize: TextSize.font14(context),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Icon(
                quiz['completed'] ? Icons.check_circle : Icons.cancel,
                size: 20,
                color: quiz['completed'] ? Colors.green : Colors.grey,
              ),
            ],
          ),
          SizedBox(height: 4),
          Text(
            quiz['subtitle'],
            style: customTextStyle(context,
                fontSize: TextSize.font12(context), color: Colors.grey.shade600),
          ),
          SizedBox(height: 12),
          _quizInfoRow(context, 'Duration:', quiz['duration']),
          _quizInfoRow(context, 'Questions:', quiz['questions'].toString()),
          if (quiz['score'] != null)
            _quizInfoRow(context, 'Score:', quiz['score']),
          SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: quiz['completed'] ? Colors.white : Colors.black,
                foregroundColor: quiz['completed'] ? Colors.black : Colors.white,
                side: quiz['completed']
                    ? BorderSide(color: Colors.black)
                    : BorderSide.none,
                padding: EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {
                // Add logic
              },
              child: Text(quiz['completed'] ? 'View Results' : 'Start Quiz'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _quizInfoRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Text(
            '$label ',
            style: customTextStyle(context,
                fontSize: TextSize.font12(context), fontWeight: FontWeight.w500),
          ),
          Spacer(),
          Text(value, style: customTextStyle(context, fontSize: TextSize.font12(context))),
        ],
      ),
    );
  }
}
