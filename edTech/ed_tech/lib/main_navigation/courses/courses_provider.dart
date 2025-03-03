import 'package:ed_tech/models/course_model.dart';
import 'package:ed_tech/services/course_service.dart';
import 'package:flutter/material.dart';

class CoursesProvider extends ChangeNotifier {
  final TextEditingController searchQueryController = TextEditingController();

  Future<List<CourseModel>> fetchAllCourses() {
    return CourseService.fetchAllCorsesFromFirebase();
  }
}
