import 'package:flutter/material.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/const/text_style.dart';

class SelfLearning extends StatefulWidget {
  const SelfLearning({super.key});

  @override
  SelfLearningState createState() => SelfLearningState();
}

class SelfLearningState extends State<SelfLearning> {
  int selectedIndex = 0;

  final List<String> tabTitles = ['Enroll Course', 'Learning Goal', 'Exploring'];

  Widget _buildEnrollContent() {
    final List<Map<String, dynamic>> enrollData = [
      {
        'title': 'Web Development',
        'courses': 12,
        'hours': 36,
        'progress': 0.6,
        'tags': ['HTML', 'CSS', 'JavaScript', 'React'],
      },
      {
        'title': 'Data Science',
        'courses': 8,
        'hours': 24,
        'progress': 0.3,
        'tags': ['Python', 'Statistics', 'Machine Learning'],
      },
      {
        'title': 'Mobile Development',
        'courses': 6,
        'hours': 18,
        'progress': 0.2,
        'tags': ['React Native', 'Flutter', 'iOS'],
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            itemCount: enrollData.length,
            separatorBuilder: (_, __) => SizedBox(width: 16),
            itemBuilder: (context, index) {
              final data = enrollData[index];
              return Container(
                width: 250,
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
                  ],
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data['title'],
                        style: customTextStyle(context,
                            fontSize: TextSize.font16(context),
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: data['progress'],
                      minHeight: 8,
                      backgroundColor: Colors.grey.shade300,
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(Icons.menu_book_outlined, size: 18),
                        SizedBox(width: 4),
                        Text('${data['courses']} Courses',
                            style: customTextStyle(context,
                                fontSize: TextSize.font12(context))),
                        Spacer(),
                        Icon(Icons.access_time, size: 18),
                        SizedBox(width: 4),
                        Text('${data['hours']} Hours',
                            style: customTextStyle(context,
                                fontSize: TextSize.font12(context))),
                      ],
                    ),
                    SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: List.generate(data['tags'].length, (i) {
                        return Container(
                          padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(data['tags'][i],
                              style: customTextStyle(context,
                                  fontSize: TextSize.font12(context),
                                  fontWeight: FontWeight.w500)),
                        );
                      }),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildRecommendContent() {
    final List<Map<String, dynamic>> goals = [
      {
        'title': 'Science Basic',
        'description': '',
        'dueDate': '4/19/2025',
      },
      {
        'title': 'Math Basic',
        'description': '',
        'dueDate': '4/25/2025',
      },
      {
        'title': 'JAVA OOP',
        'description': 'this is a programming language',
        'dueDate': '4/28/2025',
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(0),
      child: Column(
        children: goals
            .map((goal) => LearningGoalCard(
          title: goal['title'],
          description: goal['description'],
          dueDate: goal['dueDate'],
        ))
            .toList(),
      ),
    );
  }

  Widget _buildExploringContent() {
    final topics = [
      'AI Fundamentals',
      'Cybersecurity Basics',
      'Cloud Computing',
    ];

    final descriptions = [
      'Learn how machines think and make decisions.',
      'Understand threats, encryption, and safety online.',
      'Discover scalable cloud technologies and services.',
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(0),
      itemCount: topics.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFE3F2FD), Color(0xFFBBDEFB)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(2, 2))
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: ColorUtils.baseBlueColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.travel_explore, size: 32, color: Color(0xFF1976D2)),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(topics[index],
                        style: customTextStyle(context,
                            fontSize: TextSize.font16(context), fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(descriptions[index],
                        style: customTextStyle(context,
                            fontSize: TextSize.font12(context), color: Colors.black87)),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Explore'),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildContent() {
    switch (selectedIndex) {
      case 0:
        return _buildEnrollContent();
      case 1:
        return _buildRecommendContent();
      case 2:
        return _buildExploringContent();
      default:
        return Center(child: Text('Self Learning'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(tabTitles.length, (index) {
            return InkWell(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: selectedIndex == index
                      ? ColorUtils.baseBlueColor
                      : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  tabTitles[index],
                  style: customTextStyle(
                    context,
                    color: selectedIndex == index ? Colors.white : Colors.black54,
                    fontSize: TextSize.font14(context),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            );
          }),
        ),
        SizedBox(height: 16),
        Expanded(child: _buildContent()),
      ],
    );
  }
}

class LearningGoalCard extends StatelessWidget {
  final String title;
  final String description;
  final String dueDate;

  const LearningGoalCard({super.key, required this.title, required this.description, required this.dueDate});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFB3E5FC), Color(0xFF81D4FA)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
          if (description.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(description,
                  style: const TextStyle(color: Colors.black54, fontSize: 14)),
            ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text('Due Date: $dueDate',
                style: const TextStyle(color: Colors.black54, fontSize: 14)),
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: 0.0,
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white70),
              minHeight: 10,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Open', style: TextStyle(fontWeight: FontWeight.w500)),
              Text('Continue', style: TextStyle(fontWeight: FontWeight.w500)),
            ],
          )
        ],
      ),
    );
  }
}
