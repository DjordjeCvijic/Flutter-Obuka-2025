import 'package:ed_tech/main_navigation/profile/saved_courses/saved_courses_provider.dart';
import 'package:ed_tech/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../widgets/et_course_box.dart';
import '../../../widgets/et_title_with_back_button.dart';

class SavedCoursesScreen extends StatelessWidget {
  const SavedCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SavedCoursesProvider savedCoursesProvider =
        Provider.of<SavedCoursesProvider>(context, listen: false);
    final MainProvider mainProvider =
        Provider.of<MainProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              ETTitleWithBackButton(
                title: "Saved Courses",
              ),
              Gap(20),
              Consumer<SavedCoursesProvider>(
                builder: (context, value, child) => FutureBuilder(
                  future: savedCoursesProvider.fetchSavedCourses(
                      currentSavedList: mainProvider.loggedUser.savedCourses),
                  builder: (context, snapshot) => snapshot.connectionState ==
                          ConnectionState.waiting
                      ? CircularProgressIndicator()
                      : (snapshot.data!.isEmpty
                          ? Text("No saved courses")
                          : Expanded(
                              child: ListView.separated(
                                padding: EdgeInsets.only(bottom: 50),
                                separatorBuilder: (context, index) => Gap(16),
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) => ETCourseBox(
                                  courseModel: snapshot.data!.elementAt(index),
                                  onCourseRemoved: () {
                                    savedCoursesProvider.refreshScreen();
                                  },
                                ),
                              ),
                            )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
