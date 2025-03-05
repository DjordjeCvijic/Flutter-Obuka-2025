import 'dart:developer';

import 'package:ed_tech/helpers/custom_loading_indicator.dart';
import 'package:ed_tech/main_navigation/profile/create_course/create_course_provider.dart';
import 'package:ed_tech/main_provider.dart';
import 'package:ed_tech/widgets/et_button.dart';
import 'package:ed_tech/widgets/et_title_with_back_button.dart';
import 'package:ed_tech/widgets/input_fields/et_text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../helpers/custom_colors.dart';
import '../../../widgets/et_duration_picker.dart';
import '../../../widgets/input_fields/et_area_input_field.dart';

class CreateCourseScreen extends StatelessWidget {
  const CreateCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CreateCourseProvider createCourseProvider =
        Provider.of<CreateCourseProvider>(context, listen: false);
    final MainProvider mainProvider =
        Provider.of<MainProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
          child: Column(
            children: [
              ETTitleWithBackButton(title: "Create course"),
              Text("Enter data for new course"),
              Gap(20),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(top: 4),
                  child: Column(
                    spacing: 12,
                    children: [
                      ETTextInputField(
                        hintText: "Course name",
                        textEditingController:
                            createCourseProvider.courseNameController,
                      ),
                      EtAreaInputField(
                        hintText: "Course description",
                        textEditingController:
                            createCourseProvider.courseDescriptionController,
                      ),
                      ETTextInputField(
                        hintText: "Course price",
                        textEditingController:
                            createCourseProvider.coursePriceController,
                      ),
                      InkWell(
                        onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              child: EtDurationPicker(),
                            ),
                          ).then(
                            (value) {
                              if (value != null) {
                                log(value.toString());
                                createCourseProvider.setDuration(
                                    newDuration: value);
                              }
                            },
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                            border: Border.all(color: CustomColors.grey),
                          ),
                          child: Center(
                            child: Consumer<CreateCourseProvider>(
                              builder: (context, value, child) => Text(
                                "Selected duration: ${createCourseProvider.duration.inHours}:${(createCourseProvider.duration.inMinutes % 60)}",
                              ),
                            ),
                          ),
                        ),
                      ),
                      ETButton(
                        topMargin: 12,
                        bottomMargin: 12,
                        buttonText: "Pick photo",
                        onTapButton: () async {
                          createCourseProvider.pickPhotoFromGallery();
                        },
                      ),
                      ETButton(
                        leftMargin: 0,
                        rightMargin: 0,
                        topMargin: 12,
                        bottomMargin: 12,
                        buttonText: "Save Course",
                        onTapButton: () async {
                          bool success = false;
                          CustomLoadingIndicator.callMethodWithLoadingIndicator(
                            context: context,
                            callback: () async {
                              success = await createCourseProvider.saveCourse(
                                context: context,
                                loggedUserId: mainProvider.loggedUser.id!,
                              );
                            },
                            onFinished: () {
                              if (success) {
                                Navigator.of(context).pop(success);
                              }
                            },
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
