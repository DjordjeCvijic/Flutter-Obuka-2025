import 'package:ed_tech/models/user_model.dart';
import 'package:ed_tech/services/user_service.dart';
import 'package:flutter/material.dart';

class CourseDetailsProvider extends ChangeNotifier {
  final VoidCallback? onCourseRemoved;

  CourseDetailsProvider({this.onCourseRemoved});

  Future<String> getCourseCreatorsName({required String creatorId}) async {
    List<UserModel> allUsers = await UserService.fetchUsersFromFirebase();

    return allUsers.firstWhere((user) => user.id == creatorId).name;
  }

  Future<bool> saveCourse({
    required String userId,
    required String courseId,
    required List<String>? currentSavedCourses,
  }) async {
    await Future.delayed(Duration(seconds: 3));
    List<String> listToSave = [];
    if (currentSavedCourses != null) {
      listToSave.addAll(currentSavedCourses);
    }
    listToSave.add(courseId);

    bool success = await UserService.editUserSavedCoursesOnFirebase(
      userId: userId,
      listToSave: listToSave,
    );
    if (success) {
      notifyListeners();
    }
    return success;
  }

  Future<bool> removeCourse({
    required String userId,
    required String courseId,
    required List<String> currentSavedCourses,
  }) async {
    List<String> listToSave = [];

    listToSave.addAll(currentSavedCourses);
    listToSave.removeWhere(
      (element) => element == courseId,
    );
    bool success = await UserService.editUserSavedCoursesOnFirebase(
      userId: userId,
      listToSave: listToSave,
    );
    if (success) {
      if (onCourseRemoved != null) {
        onCourseRemoved!();
      }
      notifyListeners();
    }
    return success;
  }

  bool isAlreadySaved({
    required String courseId,
    required List<String>? currentSavedCourse,
  }) {
    if (currentSavedCourse == null) {
      return false;
    } else {
      return currentSavedCourse.contains(courseId);
    }
  }
}
