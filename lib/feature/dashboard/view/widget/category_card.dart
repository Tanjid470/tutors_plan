import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tutors_plan/global_widget/base_button.dart';
import 'package:tutors_plan/global_widget/custom_simmer.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/const/text_style.dart';
import 'package:tutors_plan/feature/dashboard/view/widget/course_subplot_card.dart';
import '../../../course_details/view/course_details_view.dart';

class CategoryCard extends StatelessWidget {
  final String categoryId;
  final String title;
  final String description;
  final String imageUrl;

  const CategoryCard({
    super.key,
    required this.categoryId,
    required this.title,
    required this.description,
    required this.imageUrl,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      width: MediaQuery.of(context).size.width * 0.3,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(
              color: ColorUtils.baseColor,
              width: 2,
            ),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10))
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: imageUrl.isNotEmpty
                ? CachedNetworkImage (
                    imageUrl: imageUrl,
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.3,
                    fit: BoxFit.fill,
                    placeholder: (context, url) =>
                        Center(child: CustomShimmer( height: 60,
                          width: MediaQuery.of(context).size.width * 0.3)),
                    errorWidget: (context, url, error) => Image.asset(
                      'assets/images/dummy_image.jpg',
                      height: 60,
                      width: MediaQuery.of(context).size.width * 0.3,
                      fit: BoxFit.fill,
                    ),
                )
                : Image.asset (
                    'assets/images/dummy_image.jpg',
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.3,
                    fit: BoxFit.fill,
                ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: customTextStyle(context,
                          fontSize: TextSize.font16(context),
                          fontWeight: FontWeight.bold,
                          color: ColorUtils.black)
                  ),
                ),
                // Align(
                //   alignment: Alignment.center,
                //   child: Text(
                //       description,
                //       maxLines: 1,
                //       overflow: TextOverflow.ellipsis,
                //       style: customTextStyle(context,
                //           fontSize: TextSize.font14(context),
                //           fontWeight: FontWeight.w400,
                //           color: ColorUtils.black)
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
