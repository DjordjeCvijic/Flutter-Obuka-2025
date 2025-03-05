import 'dart:async';
import 'package:ed_tech/models/course_model.dart';
import 'package:ed_tech/services/course_service.dart';
import 'package:flutter/material.dart';

class SearchResultsProvider extends ChangeNotifier {
  final TextEditingController searchQueryController = TextEditingController();
  Timer? debounce;

  SearchResultsProvider({required String searchQuery}) {
    searchQueryController.text = searchQuery;
  }

  Future<List<CourseModel>> fetchCourses() async {
    List<CourseModel> allCourses =
        await CourseService.fetchAllCorsesFromFirebase();
    List<CourseModel> resultCourses = [];
    for (CourseModel course in allCourses) {
      if (course.name
              .toLowerCase()
              .contains(searchQueryController.text.toLowerCase()) ||
          course.description
              .toLowerCase()
              .contains(searchQueryController.text.toLowerCase())) {
        resultCourses.add(course);
      }
    }
    return resultCourses;
  }

  void onSearch() {
    if (debounce != null) debounce!.cancel();
    debounce = Timer(Duration(milliseconds: 700), () {
      notifyListeners();
    });
  }
}
