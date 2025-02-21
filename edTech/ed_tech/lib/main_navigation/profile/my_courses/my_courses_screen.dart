import 'package:ed_tech/helpers/custom_colors.dart';
import 'package:ed_tech/main_navigation/profile/create_course/create_course_provider.dart';
import 'package:ed_tech/main_navigation/profile/create_course/create_course_screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/et_title_with_back_button.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              ETTitleWithBackButton(
                title: "Your Courses",
              ),
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
        tooltip: 'Increment',
        backgroundColor: CustomColors.primary,
        child: Icon(
          Icons.add,
          color: CustomColors.white,
        ),
      ),
    );
  }
}
