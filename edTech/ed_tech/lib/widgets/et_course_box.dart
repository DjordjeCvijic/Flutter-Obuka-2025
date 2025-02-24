import 'package:ed_tech/helpers/custom_themes.dart';
import 'package:ed_tech/models/course_model.dart';
import 'package:flutter/widgets.dart';

import '../helpers/custom_colors.dart';

class ETCourseBox extends StatelessWidget {
  final CourseModel courseModel;
  const ETCourseBox({
    super.key,
    required this.courseModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: CustomColors.grey),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 194,
            child: Text("course photo"),
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
                  style: ownTheme(context)
                      .pMedium!
                      .copyWith(color: CustomColors.dark),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
