import 'dart:convert';

import 'package:ed_tech/helpers/custom_colors.dart';
import 'package:ed_tech/helpers/custom_loading_indicator.dart';
import 'package:ed_tech/helpers/custom_themes.dart';
import 'package:ed_tech/helpers/et_scaffold_messenger.dart';
import 'package:ed_tech/main_provider.dart';
import 'package:ed_tech/models/course_model.dart';
import 'package:ed_tech/widgets/course_details/course_details_provider.dart';
import 'package:ed_tech/widgets/et_button.dart';
import 'package:ed_tech/widgets/et_title_with_back_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../helpers/custom_images.dart';
import '../et_price_chip.dart';

class CourseDetailsScreen extends StatelessWidget {
  final CourseModel courseModel;
  const CourseDetailsScreen({super.key, required this.courseModel});

  @override
  Widget build(BuildContext context) {
    CourseDetailsProvider courseDetailsProvider =
        Provider.of<CourseDetailsProvider>(context, listen: false);
    MainProvider mainProvider =
        Provider.of<MainProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: ETTitleWithBackButton(title: courseModel.name),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    courseModel.photoBase64Code != null
                        ? Image.memory(
                            base64Decode(courseModel.photoBase64Code!),
                            fit: BoxFit.cover,
                            width: double.infinity,
                          )
                        : Image.asset(
                            CustomImages.courseImg,
                            fit: BoxFit.cover,
                          ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: ETPriceChip(
                              price: courseModel.price,
                            ),
                          ),
                          Gap(24),
                          Text(
                            "About the course",
                            style: ownTheme(context)
                                .heading4!
                                .copyWith(color: CustomColors.dark),
                          ),
                          Gap(4),
                          Text(
                            courseModel.description,
                            style: ownTheme(context)
                                .pMedium!
                                .copyWith(color: CustomColors.dark),
                          ),
                          Gap(24),
                          Text(
                            "Duration",
                            style: ownTheme(context)
                                .heading5!
                                .copyWith(color: CustomColors.dark),
                          ),
                          Gap(4),
                          Text(
                            courseModel.duration,
                            style: ownTheme(context)
                                .pMedium!
                                .copyWith(color: CustomColors.dark),
                          ),
                          Gap(24),
                          Text(
                            "Creator",
                            style: ownTheme(context)
                                .heading5!
                                .copyWith(color: CustomColors.dark),
                          ),
                          FutureBuilder(
                            future: courseDetailsProvider.getCourseCreatorsName(
                                creatorId: courseModel.creatorId),
                            builder: (context, snapshot) =>
                                snapshot.connectionState ==
                                        ConnectionState.waiting
                                    ? CircularProgressIndicator()
                                    : Text(
                                        snapshot.data!,
                                        style: ownTheme(context)
                                            .pMedium!
                                            .copyWith(color: CustomColors.dark),
                                      ),
                          ),
                          if (mainProvider.loggedUser.id !=
                              courseModel.creatorId)
                            Consumer<CourseDetailsProvider>(
                              builder: (context, value, child) => ETButton(
                                topMargin: 52,
                                bottomMargin: 20,
                                leftMargin: 16,
                                rightMargin: 16,
                                buttonText:
                                    courseDetailsProvider.isAlreadySaved(
                                            courseId: courseModel.id!,
                                            currentSavedCourse: mainProvider
                                                .loggedUser.savedCourses)
                                        ? "Remove"
                                        : "Save",
                                onTapButton: () async {
                                  if (courseDetailsProvider.isAlreadySaved(
                                      courseId: courseModel.id!,
                                      currentSavedCourse: mainProvider
                                          .loggedUser.savedCourses)) {
                                    bool success = false;
                                    CustomLoadingIndicator
                                        .callMethodWithLoadingIndicator(
                                      context: context,
                                      callback: () async {
                                        success = await courseDetailsProvider
                                            .removeCourse(
                                                userId:
                                                    mainProvider.loggedUser.id!,
                                                courseId: courseModel.id!,
                                                currentSavedCourses:
                                                    mainProvider.loggedUser
                                                        .savedCourses!);
                                      },
                                      onFinished: () {
                                        if (success) {
                                          mainProvider.loggedUser.savedCourses!
                                              .removeWhere(
                                            (element) =>
                                                element == courseModel.id,
                                          );
                                        }

                                        ETScaffoldMessenger.showMessage(
                                            context: context,
                                            messageText: success
                                                ? "Course removed"
                                                : "Error");
                                      },
                                    );
                                  } else {
                                    bool success = false;
                                    CustomLoadingIndicator
                                        .callMethodWithLoadingIndicator(
                                      context: context,
                                      callback: () async {
                                        success = await courseDetailsProvider
                                            .saveCourse(
                                          courseId: courseModel.id!,
                                          userId: mainProvider.loggedUser.id!,
                                          currentSavedCourses: mainProvider
                                              .loggedUser.savedCourses,
                                        );
                                      },
                                      onFinished: () {
                                        if (success) {
                                          if (mainProvider
                                                  .loggedUser.savedCourses ==
                                              null) {
                                            mainProvider
                                                .loggedUser.savedCourses = [
                                              courseModel.id!
                                            ];
                                          } else {
                                            mainProvider
                                                .loggedUser.savedCourses!
                                                .add(courseModel.id!);
                                          }
                                        }

                                        ETScaffoldMessenger.showMessage(
                                            context: context,
                                            messageText: success
                                                ? "Course saved"
                                                : "Error");
                                      },
                                    );
                                  }
                                },
                              ),
                            )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
