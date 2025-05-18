import 'package:flutter/material.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/const/text_style.dart';
import 'package:tutors_plan/feature/dashboard/view/widget/feature_card_learning_art.dart';

class LearningARTView extends StatelessWidget {
  const LearningARTView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F6F9),
      appBar: AppBar(
        title: const Text("Learning ART"),
        centerTitle: true,
        leading: InkWell(
          onTap:((){
            Navigator.pop(context);
          }),
          child: Icon(Icons.arrow_back_ios)
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF6A5ACD), Color(0xFF8A2BE2)], // Slate Blue to Blue Violet
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Unlock Your Future with Learning ART",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: TextSize.font36(context),
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        textAlign: TextAlign.center,
                        "TutorsPlan LearningART has revolutionized our students learning experience. The combination of AI-powered personalization and live tutor support has significantly boosted engagement and academic performance.",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.purple,
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            onPressed: () {},
                            child: const Text("Apply Now"),
                          ),
                          const SizedBox(width: 16),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.white),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            onPressed: () {},
                            child: const Text("Learn More"),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              verticalGap(context, 1),
              Text(
                'TutorsPlan LearningART',
                style: TextStyle(
                  fontSize: TextSize.font24(context),
                  fontWeight: FontWeight.bold,
                ),
              ),
              verticalGap(context, 1),
              Text(
                'Streamlining education through Assessment,Recommendation, and Training',
                maxLines: 4,
                style: TextStyle(
                    fontSize: TextSize.font14(context),
                  color: ColorUtils.black87
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6, // adjust based on content height
                child: Center(
                  child: GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.2,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(), // disable scroll
                    children: [
                      const FeatureCard(
                        icon: Icons.support_agent,
                        title: "AI Chat Support",
                        subtitle: "Instant answers from our AI tutor",
                      ),
                      const FeatureCard(
                        icon: Icons.video_collection_outlined,
                        title: "Interactive Videos",
                        subtitle: "Engaging lessons with adaptive pacing",
                      ),
                      const FeatureCard(
                        icon: Icons.audio_file_outlined,
                        title: "Audio Learning",
                        subtitle: "AI-generated content for on-the-go studying",
                      ),
                      const FeatureCard(
                        icon: Icons.quiz,
                        title: "Quiz",
                        subtitle: "Interactive quizzes to reinforce learning",
                      ),
                      const FeatureCard(
                        icon: Icons.class_outlined,
                        title: "Group Class",
                        subtitle: "Collaborative sessions with peers",
                      ),
                      const FeatureCard(
                        icon: Icons.science_outlined,
                        title: "Local Labs",
                        subtitle: "Hands-on sessions in nearby facilities",
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '👨‍🏫 Live Tutors & Mentors',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text('✔ One-on-one sessions with expert tutors'),
                    const Text('✔ Group study sessions facilitated by mentors'),
                    const Text('✔ Personalized feedback and guidance'),
                    const Text('✔ 24/7 support from AI and human experts'),
                  ],
                ),
              ),
              verticalGap(context, 1),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '📖 AI-Based LMS',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text('✔ Adaptive learning paths tailored to individual needs'),
                    const Text('✔ Real-time progress tracking with predictive analytics'),
                    const Text('✔ Interactive AI-guided quizzes and exercises'),
                    const Text('✔ Personalized content recommendations'),
                  ],
                ),
              ),
              verticalGap(context, 1),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Frequently Asked Questions - Learning ART",
                    style: TextStyle(
                      fontSize: TextSize.font24(context),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildTile(
                    title: "What is the Learning ART program?",
                    content:
                    "Learning ART is a comprehensive educational initiative designed to integrate Art, Robotics, and Technology for students of all ages.",
                  ),
                  const SizedBox(height: 10),
                  _buildTile(
                    title: "Who can join the program?",
                    content:
                    "Students from grades K-12 with a curiosity for creativity, robotics, and digital skills are welcome to join.",
                  ),
                  const SizedBox(height: 10),
                  _buildTile(
                    title: "What will I learn?",
                    content:
                    "You’ll explore drawing, digital art, robotics basics, coding, and hands-on tech-art projects.",
                  ),
                  const SizedBox(height: 10),
                  _buildTile(
                    title: "Are there any materials required?",
                    content:
                    "Basic supplies like paper and markers are needed. For advanced modules, robotics kits or a tablet may be recommended.",
                  ),
                ],
              ),

              verticalGap(context, 5)
            ],
          ),
        ),
      ),
    );
  }

  Widget featureCard({
    required IconData icon,
    required String title,
    required String desc,
    required BuildContext context}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 5,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: ColorUtils.baseColor),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: TextSize.font16(context), fontWeight: FontWeight.bold),
          ),
          Flexible(
            child: Text(
              desc,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: TextSize.font12(context)),
            ),
          ),
        ],
      ),
    );
  }

  Widget registerFlowItem({
    required String serialNo,
    required String title,
    required String desc,
    required BuildContext context}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 7,
      children: [
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: ColorUtils.baseColor,
            shape: BoxShape.circle
          ),
          child: Center(child: Text(serialNo,style: customTextStyle(context,fontSize: TextSize.font16(context),fontWeight: FontWeight.bold,color: Colors.white),))
        ),
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: TextSize.font16(context), fontWeight: FontWeight.bold),
        ),
        Flexible(
          child: Text(
            desc,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: TextSize.font12(context)),
          ),
        ),
      ],
    );
  }

  Widget _buildTile({required String title, required String content}) {
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(8),
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          tilePadding: const EdgeInsets.symmetric(horizontal: 16),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: Text(content),
            ),
          ],
        ),
      ),
    );
  }

}
