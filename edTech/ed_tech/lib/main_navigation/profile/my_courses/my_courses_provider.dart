import 'package:ed_tech/models/course_model.dart';
import 'package:ed_tech/services/course_service.dart';
import 'package:flutter/foundation.dart';

class MyCoursesProvider extends ChangeNotifier {
  ///Method from provider
  Future<List<CourseModel>> fetchCourses({required String loggedUserId}) async {
    List<CourseModel> allCourses =
        await CourseService.fetchAllCorsesFromFirebase();

    return allCourses
        .where((course) => course.creatorId == loggedUserId)
        .toList()
        .reversed
        .toList();
  }

  void refreshScreen() {
    notifyListeners();
  }

  Future<bool> deleteCourse({required String courseId}) async {
    bool isCourseDeleted =
        await CourseService.deleteCourseFromFirebase(courseId: courseId);
    if (isCourseDeleted) {
      notifyListeners();
    }
    return isCourseDeleted;
  }
}
