import 'dart:convert';
import 'dart:developer';

import 'package:ed_tech/models/course_model.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import '../helpers/global_const.dart';

class CourseService {
  static Future<bool> saveCourseDataOnFirebase({
    required CourseModel courseModel,
  }) async {
    try {
      String url = FirebaseConst.firebaseURL + FirebaseConst.courseNode;
      Response response = await http.post(
        Uri.parse(url),
        body: jsonEncode(
          courseModel.toJson(),
        ),
      );

      return response.statusCode == 200;
    } catch (e) {
      log("Exception saveCourseDataOnFirebase: $e");
      return false;
    }
  }

  static Future<List<CourseModel>> fetchAllCorsesFromFirebase() async {
    List<CourseModel> courseList = [];
    String url = FirebaseConst.firebaseURL + FirebaseConst.courseNode;

    Response response = await http.get(Uri.parse(url));

    if (response.body != "null") {
      Map<String, dynamic> decodedRes = jsonDecode(response.body);

      decodedRes.forEach((key, value) {
        CourseModel user = CourseModel.fromJson(value, key);
        courseList.add(user);
      });
    }
    return courseList;
  }

  static Future<bool> deleteCourseFromFirebase({
    required String courseId,
  }) async {
    String url = "${FirebaseConst.firebaseURL}/course/$courseId.json";

    Response response = await http.delete(Uri.parse(url));

    if (response.statusCode != 200) {
      log("ERROR: ${response.body}");
    }

    return response.statusCode == 200;
  }
}
