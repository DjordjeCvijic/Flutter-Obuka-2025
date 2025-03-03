import 'dart:convert';

import 'package:ed_tech/helpers/custom_images.dart';
import 'package:ed_tech/helpers/custom_themes.dart';
import 'package:ed_tech/models/course_model.dart';
import 'package:ed_tech/widgets/course_details/course_details_provider.dart';
import 'package:ed_tech/widgets/course_details/course_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/custom_colors.dart';
import 'et_price_chip.dart';

class ETCourseBox extends StatelessWidget {
  final VoidCallback? onCourseRemoved;
  final CourseModel courseModel;
  const ETCourseBox({
    super.key,
    required this.courseModel,
    this.onCourseRemoved,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
              create: (context) =>
                  CourseDetailsProvider(onCourseRemoved: onCourseRemoved),
              child: CourseDetailsScreen(
                courseModel: courseModel,
              ),
            ),
          ),
        );
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          border: Border.all(color: CustomColors.grey),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 194,
                  child: courseModel.photoBase64Code != null
                      ? Image.memory(
                          base64Decode(courseModel.photoBase64Code!),
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          CustomImages.courseImg,
                          fit: BoxFit.cover,
                        ),
                ),
                Positioned(
                  right: 16,
                  bottom: 8,
                  child: ETPriceChip(
                    price: courseModel.price,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    courseModel.duration,
                    style: ownTheme(context)
                        .pSmall!
                        .copyWith(color: CustomColors.successColor),
                  ),
                  Text(
                    courseModel.name,
                    style: ownTheme(context)
                        .heading4!
                        .copyWith(color: CustomColors.dark),
                  ),
                  Text(
                    courseModel.description,
                    overflow: TextOverflow.ellipsis,
                    style: ownTheme(context)
                        .pMedium!
                        .copyWith(color: CustomColors.dark),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
