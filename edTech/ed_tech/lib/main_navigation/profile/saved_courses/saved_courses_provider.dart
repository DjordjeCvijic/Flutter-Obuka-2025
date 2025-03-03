import 'package:ed_tech/models/course_model.dart';
import 'package:flutter/foundation.dart';

import '../../../services/course_service.dart';

class SavedCoursesProvider extends ChangeNotifier {
  Future<List<CourseModel>> fetchSavedCourses({
    required List<String>? currentSavedList,
  }) async {
    if (currentSavedList == null) {
      return [];
    } else {
      List<CourseModel> allCoursesFromFirebase =
          await CourseService.fetchAllCorsesFromFirebase();
      List<CourseModel> savedCourses = [];
      for (var course in allCoursesFromFirebase) {
        if (currentSavedList.contains(course.id)) {
          savedCourses.add(course);
        }
      }
      return savedCourses;
    }
  }

  void refreshScreen() {
    notifyListeners();
  }
}
