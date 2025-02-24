import 'package:ed_tech/helpers/custom_colors.dart';
import 'package:ed_tech/main_navigation/profile/create_course/create_course_provider.dart';
import 'package:ed_tech/main_navigation/profile/create_course/create_course_screen.dart';
import 'package:ed_tech/main_navigation/profile/my_courses/my_courses_provider.dart';
import 'package:ed_tech/main_provider.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../widgets/et_course_box.dart';
import '../../../widgets/et_title_with_back_button.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              ETTitleWithBackButton(
                title: "Your Courses",
              ),
              Gap(20),
              FutureBuilder(
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
                              ),
                            ),
                          )),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider(
                create: (context) => CreateCourseProvider(),
                child: CreateCourseScreen(),
              ),
            ),
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
