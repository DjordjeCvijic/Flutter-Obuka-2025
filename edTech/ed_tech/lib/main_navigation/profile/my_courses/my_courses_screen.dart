import 'package:ed_tech/helpers/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '/helpers/custom_colors.dart';
import '/helpers/et_scaffold_messenger.dart';
import '/main_provider.dart';
import '/widgets/et_course_box.dart';
import '/widgets/et_title_with_back_button.dart';
import '../create_course/create_course_provider.dart';
import '../create_course/create_course_screen.dart';
import 'my_courses_provider.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MyCoursesProvider myCoursesProvider =
        Provider.of<MyCoursesProvider>(context, listen: false);
    final MainProvider mainProvider =
        Provider.of<MainProvider>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
          child: Column(
            children: [
              ETTitleWithBackButton(
                title: "Your Courses",
              ),
              Gap(20),
              Consumer<MyCoursesProvider>(
                builder: (context, value, child) => FutureBuilder(
                  future: myCoursesProvider.fetchCourses(
                      loggedUserId: mainProvider.loggedUser.id!),
                  builder: (context, snapshot) => snapshot.connectionState ==
                          ConnectionState.waiting
                      ? CircularProgressIndicator()
                      : (snapshot.data!.isEmpty
                          ? Text("No created courses")
                          : Expanded(
                              child: ListView.separated(
                                padding: EdgeInsets.only(bottom: 50),
                                separatorBuilder: (context, index) => Gap(16),
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) => ETCourseBox(
                                  courseModel: snapshot.data!.elementAt(index),
                                  onDeleteCourse: () async {
                                    bool success = false;
                                    CustomLoadingIndicator
                                        .callMethodWithLoadingIndicator(
                                      context: context,
                                      callback: () async {
                                        success = await myCoursesProvider
                                            .deleteCourse(
                                                courseId: snapshot.data!
                                                    .elementAt(index)
                                                    .id!);
                                      },
                                      onFinished: () {
                                        ETScaffoldMessenger.showMessage(
                                            context: context,
                                            messageText: success
                                                ? "Course deleted"
                                                : "Error");
                                      },
                                    );
                                  },
                                ),
                              ),
                            )),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
            MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider(
                create: (context) => CreateCourseProvider(),
                child: CreateCourseScreen(),
              ),
            ),
          )
              .then(
            (value) {
              if (value != null && value) {
                myCoursesProvider.refreshScreen();
              }
            },
          );
        },
        backgroundColor: CustomColors.primary,
        child: Icon(
          Icons.add,
          color: CustomColors.white,
        ),
      ),
    );
  }
}
