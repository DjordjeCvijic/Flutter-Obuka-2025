import 'dart:convert';
import 'dart:developer';

import 'package:ed_tech/models/user_model.dart';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../helpers/global_const.dart';

class UserService {
  static Future<List<UserModel>> fetchUsersFromFirebase() async {
    List<UserModel> userList = [];
    String url = FirebaseConst.firebaseURL + FirebaseConst.userNode;

    Response response = await http.get(Uri.parse(url));

    if (response.body != "null") {
      Map<String, dynamic> decodedRes = jsonDecode(response.body);

      decodedRes.forEach((key, value) {
        UserModel user = UserModel.fromJson(value, key);
        userList.add(user);
      });
    }
    return userList;
  }

  static Future<bool> saveUserDataOnFirebase(
      {required UserModel userData}) async {
    String url = FirebaseConst.firebaseURL + FirebaseConst.userNode;
    Response response = await http.post(
      Uri.parse(url),
      body: jsonEncode(
        userData.toJson(),
      ),
    );

    return response.statusCode == 200;
  }

  static Future<bool> editUserNameOnFirebase({
    required String userId,
    required String newName,
  }) async {
    String url = "${FirebaseConst.firebaseURL}/user/$userId.json";
    Response response = await http.patch(
      Uri.parse(url),
      body: jsonEncode(
        {
          "name": newName,
        },
      ),
    );
    if (response.statusCode != 200) {
      log("ERROR: ${response.body}");
    }

    return response.statusCode == 200;
  }

  static Future<bool> editUserPasswordOnFirebase({
    required String userId,
    required String newPassword,
  }) async {
    try {
      DateTime nowDateTime = DateTime.now();

      String url = "${FirebaseConst.firebaseURL}/user/$userId.json";
      Response response = await http.patch(
        Uri.parse(url),
        body: jsonEncode(
          {
            "password": newPassword,
            "password_changed_at": nowDateTime.toIso8601String(),
          },
        ),
      );
      if (response.statusCode != 200) {
        log("ERROR: ${response.body}");
      }

      return response.statusCode == 200;
    } catch (exception) {
      log("EXCEPTION editUserPasswordOnFirebase : $exception");
      return false;
    }
  }

  static Future<bool> editUserSavedCoursesOnFirebase({
    required String userId,
    required List<String> listToSave,
  }) async {
    String url = "${FirebaseConst.firebaseURL}/user/$userId.json";
    Response response = await http.patch(
      Uri.parse(url),
      body: jsonEncode(
        {
          "saved_courses": listToSave.join(","),
        },
      ),
    );
    if (response.statusCode != 200) {
      log("ERROR: ${response.body}");
    }

    return response.statusCode == 200;
  }

  static void setUserLoggedIn(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(SharedPreferencesKeys.loggedIn, value);
  }

  static void writeEmailToSP({required String email}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(SharedPreferencesKeys.userEmail, email);
  }

  static Future<String?> readEmailFromSP() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPreferencesKeys.userEmail);
  }
}
