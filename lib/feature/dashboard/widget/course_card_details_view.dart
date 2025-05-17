import 'package:flutter/material.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/const/text_style.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/common_widget/base_button.dart';

class CourseDetailsScreen extends StatelessWidget {
  const CourseDetailsScreen({super.key});

  final String courseTitle = "Creative Art & Design - Grade 6";
  final String instructor = "Tanjid Hossain Amran";
  final String location = "Dhaka, Bangladesh";
  final String description = "This course encourages students to express themselves through drawing, painting, and design principles.";
  final String outcome = "Students will learn various artistic techniques and improve their creativity through hands-on projects.";
  final String prerequisites = "Basic drawing and painting skills.";

  final int bookLessons = 12;
  final int videoLessons = 18;
  final int liveSessions = 10;
  final int quizzes = 10;
  final int modules = 9;
  final int enrolledStudents = 60;
  final String duration = "3 months";

  final double oldPrice = 50;
  final double newPrice = 40;
  final int discount = 20;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: ColorUtils.white,
        appBar: AppBar(
          title: Text(courseTitle),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16),
          child: BaseButton(
            onClick: () {},
            title: "Buy Now for \$$newPrice",
            fontSize: TextSize.font14(context),
            padding: const EdgeInsets.symmetric(vertical: 12),
            borderRadius: 12,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    'assets/images/dummy_image.jpg',
                    width: double.infinity,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 12,
                    left: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      color: Colors.black54,
                      child: Text(
                        "$discount% OFF",
                        style: customTextStyle(context,
                            fontSize: TextSize.font12(context),
                            fontWeight: FontWeight.bold,
                            color: ColorUtils.white),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(courseTitle,
                        style: customTextStyle(context,
                            fontSize: TextSize.font20(context),
                            fontWeight: FontWeight.bold,
                            color: ColorUtils.black)),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orangeAccent, size: 18),
                        Icon(Icons.star, color: Colors.orangeAccent, size: 18),
                        Icon(Icons.star, color: Colors.orangeAccent, size: 18),
                        Icon(Icons.star, color: Colors.orangeAccent, size: 18),
                        Icon(Icons.star_half, color: Colors.orangeAccent, size: 18),
                        const SizedBox(width: 8),
                        Text("4.5 ($enrolledStudents Students)",
                            style: customTextStyle(context,
                                fontSize: TextSize.font12(context),
                                fontWeight: FontWeight.w500,
                                color: ColorUtils.black54)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text("\$$oldPrice",
                            style: customTextStyle(context,
                                fontSize: TextSize.font14(context),
                                fontWeight: FontWeight.w400,
                                color: Colors.red,)),
                        const SizedBox(width: 8),
                        Text("\$$newPrice",
                            style: customTextStyle(context,
                                fontSize: TextSize.font18(context),
                                fontWeight: FontWeight.bold,
                                color: ColorUtils.baseColor)),
                      ],
                    ),
                  ],
                ),
              ),
              TabBar(
                isScrollable: true,
                labelColor: ColorUtils.baseColor,
                unselectedLabelColor: Colors.grey,
                indicatorColor: ColorUtils.baseColor,
                tabAlignment: TabAlignment.center,
                labelStyle: customTextStyle(context,
                    fontSize: TextSize.font16(context),
                    fontWeight: FontWeight.bold,
                    color: ColorUtils.black),
                tabs: const [
                  Tab(text: "Overview"),
                  Tab(text: "Curriculum"),
                  Tab(text: "Tutor"),
                  Tab(text: "Institution"),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    _overviewTab(context),
                    _curriculumTab(context),
                    _tutorTab(context),
                    _institutionTab(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _overviewTab(BuildContext context) => SingleChildScrollView(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildOverviewItem(context, Icons.description, "Course Description", description),
        _buildOverviewItem(context, Icons.check_circle_outline, "Course Outcomes", outcome),
        _buildOverviewItem(context, Icons.bookmark_outline, "Prerequisites", prerequisites),
      ],
    ),
  );

  Widget _buildOverviewItem(BuildContext context, IconData icon, String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: ColorUtils.baseColor, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: customTextStyle(context,
                        fontSize: TextSize.font16(context),
                        fontWeight: FontWeight.bold,
                        color: ColorUtils.black)),
                const SizedBox(height: 4),
                Text(content, style: _descStyle(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _curriculumTab(BuildContext context) => SingleChildScrollView(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(context, "Course Features"),
        _buildInfoRow(context, Icons.calendar_today, "Duration", duration),
        _buildInfoRow(context, Icons.view_module, "Modules", "$modules"),
        _buildInfoRow(context, Icons.menu_book, "Book Lessons", "$bookLessons"),
        _buildInfoRow(context, Icons.play_circle_fill, "Video Lessons", "$videoLessons"),
        _buildInfoRow(context, Icons.school, "Live Sessions", "$liveSessions"),
        _buildInfoRow(context, Icons.quiz, "Quizzes", "$quizzes"),
        _buildInfoRow(context, Icons.group, "Enrolled Students", "$enrolledStudents"),
        if (duration.isEmpty || modules == 0)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text("Some course details may be missing.",
                style: customTextStyle(context,
                    fontSize: TextSize.font12(context),
                    fontWeight: FontWeight.w400,
                    color: Colors.redAccent)),
          ),
      ],
    ),
  );

  Widget _tutorTab(BuildContext context) => SingleChildScrollView(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(context, "Course Instructor"),
        _buildInstructorRow(context),
        const SizedBox(height: 8),
        Text("Instructor should encourage experimentation with different art techniques and materials.",
            style: _descStyle(context)),
      ],
    ),
  );

  Widget _institutionTab(BuildContext context) => SingleChildScrollView(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(context, "Institution Info"),
        Text("Creative Art Institute\nDhaka, Bangladesh", style: _descStyle(context)),
        const SizedBox(height: 12),
        Text("We provide engaging art education for school students using hands-on approaches.",
            style: _descStyle(context)),
      ],
    ),
  );

  TextStyle _descStyle(BuildContext context) => customTextStyle(
      context,
      fontSize: TextSize.font14(context),
      fontWeight: FontWeight.w400,
      color: ColorUtils.black87);

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(title,
          style: customTextStyle(context,
              fontSize: TextSize.font16(context),
              fontWeight: FontWeight.bold,
              color: ColorUtils.black)),
    );
  }

  Widget _buildInstructorRow(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.person, size: 20),
        const SizedBox(width: 6),
        Text(instructor,
            style: customTextStyle(context,
                fontSize: TextSize.font14(context),
                fontWeight: FontWeight.w500,
                color: ColorUtils.black54)),
        const Spacer(),
        const Icon(Icons.location_on, size: 18, color: Colors.redAccent),
        const SizedBox(width: 4),
        Text(location,
            style: customTextStyle(context,
                fontSize: TextSize.font12(context),
                fontWeight: FontWeight.w500,
                color: ColorUtils.black54)),
      ],
    );
  }

  Widget _buildInfoRow(BuildContext context, IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 18, color: ColorUtils.baseColor),
          const SizedBox(width: 10),
          Expanded(
            child: Text("$label: $value",
                style: customTextStyle(context,
                    fontSize: TextSize.font14(context),
                    fontWeight: FontWeight.w500,
                    color: ColorUtils.black87)),
          ),
        ],
      ),
    );
  }
}