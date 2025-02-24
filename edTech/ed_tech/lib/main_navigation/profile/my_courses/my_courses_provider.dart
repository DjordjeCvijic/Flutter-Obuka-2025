import 'package:ed_tech/models/course_model.dart';
import 'package:ed_tech/services/course_service.dart';
import 'package:flutter/foundation.dart';

class MyCoursesProvider extends ChangeNotifier {
  Future<List<CourseModel>> fetchCourses({required String loggedUserId}) async {
    List<CourseModel> allCourses =
        await CourseService.fetchAllCorsesFromFirebase();

    return allCourses
        .where((course) => course.creatorId == loggedUserId)
        .toList()
        .reversed
        .toList();
  }
}
