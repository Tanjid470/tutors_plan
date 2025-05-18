import 'package:flutter/material.dart';
import 'package:tutors_plan/config/font_constants.dart';

import 'bullet_point_card.dart';
import 'info_card.dart';

class MoreInfoTutorsPlanView extends StatelessWidget {
  const MoreInfoTutorsPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios)
        ),
        title: Text(
          "About TutorsPlan",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: TextSize.font20(context),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Revolutionizing the Future of Learning Through AI, Live Educators, and Universal Access",
              style: TextStyle(
                fontSize: TextSize.font18(context),
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "TutorsPlan is a global education movement built to solve one of the most critical challenges of our time: delivering personalized, high-quality learning to every child—regardless of their background, income level, or location. Our platform blends advanced AI technology, certified human tutors, and scholarship-backed access into a unified, scalable solution for K–12 education.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: TextSize.font16(context),
                color: Colors.black87,
                height: 1.5,
              ),
            ),
            Text(
              "At our core, we believe that every student deserves a fair shot at success. Our mission is to bridge the gap between affordability and excellence by removing barriers and delivering a world-class educational experience to every learner."
              ,style: TextStyle(
                fontSize: TextSize.font16(context),
                color: Colors.black87,
                height: 1.5,
              ),
              textAlign: TextAlign.justify,
            ),
            Text(
              "TutorsPlan is more than just a platform—it's a global ecosystem of opportunity, empowerment, and innovation designed to uplift students, create jobs, and transform communities.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: TextSize.font16(context),
                color: Colors.black87,
                height: 1.5,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "What Makes TutorsPlan Different",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: TextSize.font20(context),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            InfoCard(
              borderColor: Colors.red,
              title: "🌟 Live Tutoring with Certified Educators",
              subtitle:
              "We combine the irreplaceable value of real human interaction with the intelligence of modern technology. Students receive one-on-one and small-group tutoring from certified educators trained in evidence-based teaching strategies. From foundational K–12 subjects to advanced areas like SAT/ACT prep, coding, robotics, and AI—our tutors personalize each session to meet learners exactly where they are.",
              secondarySubtitle:
              "Tutors are sourced from a global talent pool, including the U.S., South Asia, Latin America, and Africa, ensuring diverse representation and 24/7 availability.",
              context: context,
            ),
            InfoCard(
              borderColor: Colors.green,
              title: "🧠 LearningART – Our AI-Powered Learning Platform",
              subtitle:
              "LearningART, our proprietary LMS, drives a personalized learning journey for each student. The platform starts by understanding a student's goals and current level, then builds a structured learning path using multi-layered assessments, interactive lessons, smart quizzes, and real-time feedback.",
              secondarySubtitle:
              "Whether a student prefers self-paced learning, hands-on labs, or live tutoring, LearningART adapts dynamically—fostering not just academic mastery, but confidence, independence, and joy in learning.",
              context: context,
            ),
            InfoCard(
              borderColor: Colors.orange,
              title: "🎓 ScholarPASS – Making Education Affordable for All",
              subtitle:
              "ScholarPASS is our fully automated scholarship platform that ensures no student is held back due to cost. It brings together corporate CSR programs, philanthropic donors, educational grants, and individual contributions to fund tuition, tutoring, and course materials.",
              secondarySubtitle:
              "Through transparent application processes and impact tracking, we ensure that donor contributions go directly toward student learning—with maximum accountability and zero red tape. ScholarPASS also provides dedicated pathways for children of employee sponsors and nonprofit partners.",
              context: context,
            ),
            InfoCard(
              borderColor: Colors.blue,
              title: "🌍 LearningHub – A Marketplace for Global Learning Opportunities",
              subtitle:
              "The TutorsPlan LearningHub connects students to top-tier educational providers both locally and globally. Whether it's a local learning lab, a regional tutoring center, or a prestigious online program, LearningHub curates quality education and makes it discoverable to families everywhere.",
              secondarySubtitle:
              "Each partner is carefully vetted for instructional quality, inclusivity, and alignment with TutorsPlan's mission. Learners are matched to opportunities that fit their goals—backed by scholarships and progress tracked through LearningART.",
              context: context,
            ),
            InfoCard(
              borderColor: Colors.purple,
              title: "🛒 TutorsPlan Store – Enabling Hands-On Discovery",
              subtitle:
              "Learning doesn't stop at the screen. Our Store offers school supplies, STEM kits, robotics tools, and hands-on learning accessories that are aligned with TutorsPlan courses. These resources enable students to engage in real-world experimentation and creative exploration—whether in class, at home, or in learning labs.",
              secondarySubtitle:
              "We also work directly with schools and learning centers to supply bulk educational kits and equipment for use in classrooms and labs.",
              context: context,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Our Social Impact",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: TextSize.font20(context),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              "At TutorsPlan, education is a tool for equity, empowerment, and transformation. Our work is guided by a deep sense of purpose and a measurable commitment to social good.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: TextSize.font16(context),
                color: Colors.black87,
                height: 1.5,
              ),
            ),
            BulletPointCard(
              borderColor: Colors.teal,
              items: [
                {
                  "title": "Access for All",
                  "description": "We ensure that children in underserved and marginalized communities receive the same level of support and opportunity as their peers.",
                },
                {
                  "title": "Empowering Women",
                  "description": "Through tutoring franchises and EdTech partnerships, we help thousands of women launch and lead education businesses, giving them financial independence and leadership opportunities.",
                },
                {
                  "title": "Job Creation & Global Workforce Development",
                  "description": "We are building a distributed workforce of tens of thousands of tutors, curriculum specialists, and digital educators—creating dignified employment across multiple countries.",
                },
                {
                  "title": "Supporting Minority Entrepreneurs",
                  "description": "Our franchise model helps local leaders and educators build their own tutoring businesses with technology, training, and operational support from TutorsPlan.",
                },
                {
                  "title": "Measurable Impact",
                  "description": "We monitor student progress in real time, enabling tutors, parents, and funders to see academic gains, engagement levels, and learning milestones with transparency and trust.",
                },
              ],
            ),


          ],
        ),
      ),
    );
  }
}
