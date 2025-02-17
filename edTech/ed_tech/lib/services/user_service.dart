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
    String url = GlobalConst.firebaseURL + GlobalConst.userNode;

    Response response = await http.get(Uri.parse(url));

    log("Response as string: ${response.body}");
    if (response.body != "null") {
      Map<String, dynamic> decodedRes = jsonDecode(response.body);

      decodedRes.forEach((key, value) {
        UserModel user = UserModel.fromJson(value, key);
        userList.add(user);
      });
    }
    return userList;
  }

  static Future<bool> saveUserData({required UserModel userData}) async {
    String url = GlobalConst.firebaseURL + GlobalConst.userNode;
    Response response = await http.post(
      Uri.parse(url),
      body: jsonEncode(
        userData.toJson(),
      ),
    );

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
