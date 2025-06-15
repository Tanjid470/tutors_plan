import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/const/text_style.dart';
import 'package:tutors_plan/feature/exam/data/exam_response.dart';

class ExamCard extends StatelessWidget {
  const ExamCard({
    super.key,
    required this.context,
    required this.exams,
  });

  final BuildContext context;
  final Exams exams;


  String formatExamTime(String? time) {
    if (time == null) return '';

    final parsedTime = DateTime.parse(time);
    final formatter = DateFormat('MMMM d, y • h:mm a'); // e.g., June 15, 2025 • 9:00 AM
    return formatter.format(parsedTime);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border(
          left: BorderSide(
            color: ColorUtils.baseColor,
            width: 5.0,
          ),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 5,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  exams.title ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: customTextStyle(
                    context,
                    fontSize: TextSize.font16(context),
                    fontWeight: FontWeight.bold,
                    color: ColorUtils.black,
                  ),
                ),
              ),
              if (exams.isPracticeExam == false)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: ColorUtils.shimmerColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: ColorUtils.baseColor,
                      width: 1
                  ),
                ),
                child: Text(
                 'Practice',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: customTextStyle(
                    context,
                    fontSize: TextSize.font14(context),
                    fontWeight: FontWeight.w400,
                    color: ColorUtils.baseColor,
                  ),
                ),
              ),
            ],
          ),
          Text(
            exams.description ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: customTextStyle(
              context,
              fontSize: TextSize.font14(context),
              fontWeight: FontWeight.w500,
              color: ColorUtils.black.withOpacity(0.8),
            ),
          ),
          Wrap(
            spacing: 10,
            runSpacing: 6,
            children: [
              _infoIcon(Icons.leaderboard, exams.masterExamDifficultyLevelType?.name ?? ''),
              _infoIcon(Icons.timer, "${exams.examDurationMinutes} minutes"),
              _infoIcon(Icons.quiz, "${exams.totalQuestionsToAppear} Q"),
              _infoIcon(Icons.check_circle, "Pass: ${exams.passingScore}/${exams.totalScore}"),
            ],
          ),
          Column(
            spacing: 2,
            children: [
              Row(
                children: [
                  Text(
                    "Start time: ",
                    style: customTextStyle(
                      context,
                      fontSize: TextSize.font14(context),
                      color: ColorUtils.black.withOpacity(0.7),
                    ),
                  ),
                  Text(
                    formatExamTime(exams.startDateTime),
                    style: customTextStyle(
                      context,
                      fontSize: TextSize.font14(context),
                      color: ColorUtils.baseColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "End time: ",
                    style: customTextStyle(
                      context,
                      fontSize: TextSize.font14(context),
                      color: ColorUtils.black.withOpacity(0.7),
                    ),
                  ),
                  Text(
                    formatExamTime(exams.endDateTime),
                    style: customTextStyle(
                      context,
                      fontSize: TextSize.font14(context),
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (exams.preRequisites != null)
            Text(
              "Pre-Requisites: ${exams.preRequisites}",
              style: customTextStyle(
                context,
                fontSize: TextSize.font14(context),
                color: ColorUtils.black.withOpacity(0.7),
              ),
            ),

          if (exams.examTags != null && exams.examTags!.isNotEmpty) ...[
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: ColorUtils.shimmerColor,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: ColorUtils.baseColor,
                      width: 1
                    ),
                  ),
                  child: Text(
                    exams.course?.name ?? '',
                    style: TextStyle(
                      color: ColorUtils.baseColor,
                      fontSize: TextSize.font14(context),
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                ...exams.examTags!
                    .split(',')
                    .take(3)
                    .map((tag) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: ShapeDecoration(
                    color: Colors.grey.shade300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    tag.trim(),
                    style: TextStyle(
                      color: const Color(0xFF000000),
                      fontSize: TextSize.font14(context),
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),),
                if (exams.examTags!.split(',').length > 3)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: ShapeDecoration(
                      color: Colors.grey.shade300,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      '+${exams.examTags!.split(',').length - 3}',
                      style: TextStyle(
                        color: const Color(0xFF000000),
                        fontSize: TextSize.font14(context),
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
              ],
            ),
          ]
        ],
      ),
    );
  }

  Widget _infoIcon(IconData icon, String? text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: ColorUtils.baseColor, size: 16),
        const SizedBox(width: 4),
        Text(
          text ?? '',
          style: customTextStyle(
            context,
            fontSize: TextSize.font14(context),
            fontWeight: FontWeight.w500,
            color: ColorUtils.black,
          ),
        ),
      ],
    );
  }
}
