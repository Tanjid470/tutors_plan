import 'package:flutter/material.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/const/text_style.dart';

class ScholarPassView extends StatelessWidget {
  const ScholarPassView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F6F9),
      appBar: AppBar(
        title: const Text("ScholarsPASS"),
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
                    colors: [Color(0xFFB84DFF), Color(0xFFF24E6D)],
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
                        "Unlock Your Future with ScholarPASS",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: TextSize.font36(context),
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "K12 Courses, Coding and Robotics Classes. Empowering Students with Affordable Education!",
                        textAlign: TextAlign.center,
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
                'ScholarsPASS Program Highlights & Benefits',
                style: TextStyle(
                  fontSize: TextSize.font24(context),
                  fontWeight: FontWeight.bold,
                ),
              ),
              verticalGap(context, 1),
              Text(
                'TutorsPlan ScholarsPASS is a comprehensive scholarship program designed to make education accessible and affordable for all K-12 students. By covering a significant portion of course fees, ScholarsPASS ensures that financial constraints do not stand in the way of academic success.',
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
                      featureCard(
                        icon: Icons.menu_book,
                        title: "Academic K12 Courses",
                        desc: "Comprehensive K12 curriculum covering all core subjects and electives.",
                        context: context,
                      ),
                      featureCard(
                        icon: Icons.memory,
                        title: "Coding & Robotics Workshops",
                        desc: "Build and program robots, exploring the intersection of hardware and software.",
                        context: context,
                      ),
                      featureCard(
                        icon: Icons.handyman,
                        title: "Hands-on Projects",
                        desc: "Apply your skills to real-world projects and build an impressive portfolio.",
                        context: context,
                      ),
                      featureCard(
                        icon: Icons.attach_money,
                        title: "Maximum Fees Covered",
                        desc: "Scholarships cover the majority of course fees, making quality education accessible.",
                        context: context,
                      ),
                      featureCard(
                        icon: Icons.group,
                        title: "Expert 1:1 Tutors",
                        desc: "Access to volunteer tutors and experienced professionals in various fields.",
                        context: context,
                      ),
                      featureCard(
                        icon: Icons.verified,
                        title: "Certification",
                        desc: "Earn certificates to showcase your newly acquired skills.",
                        context: context,
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                'How It Works',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: TextSize.font24(context),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35, // adjust based on content height
                child: Center(
                  child: GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 5,
                    childAspectRatio: 1.5,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(), // disable scroll
                    children: [
                      registerFlowItem(
                        serialNo: '1',
                        title: "Apply",
                        desc: "Submit your application online or through your school.",
                        context: context,
                      ),
                      registerFlowItem(
                        serialNo: '2',
                        title: "Get Approved",
                        desc: "We will review your application and notify you of acceptance.",
                        context: context,
                      ),
                      registerFlowItem(
                        serialNo: '3',
                        title: "Enroll",
                        desc: "Choose your courses and set up your learning schedule.",
                        context: context,
                      ),
                      registerFlowItem(
                        serialNo: '4',
                        title: "Start Learning",
                        desc: "Begin your journey into the world of coding and robotics!",
                        context: context,
                      ),

                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Frequently Asked Questions",
                    style: TextStyle(
                      fontSize: TextSize.font24(context),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildTile(
                    title: "Who is eligible for ScholarPASS?",
                    content:
                    "ScholarPASS is available to all K-12 students. We aim to provide opportunities to students from diverse backgrounds, with a focus on those who might not otherwise have access to such programs.",
                  ),
                  const SizedBox(height: 10),
                  _buildTile(
                    title: "How much does it cost?",
                    content: "Most of the fees are covered by scholarships, making it highly affordable.",
                  ),
                  const SizedBox(height: 10),
                  _buildTile(
                    title: "What courses are offered?",
                    content: "K-12 academic subjects, coding, robotics, hands-on projects, and more.",
                  ),
                  const SizedBox(height: 10),
                  _buildTile(
                    title: "How long are the courses?",
                    content: "Course durations vary, typically ranging from a few weeks to several months.",
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
          Icon(icon, size: 40, color: ColorUtils.baseBlueColor),
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
            color: ColorUtils.baseBlueColor,
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
