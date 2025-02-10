import 'dart:convert';
import 'dart:developer';

import 'package:ed_tech/models/user_model.dart';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
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
        UserModel user = UserModel.fromJson(value);
        userList.add(user);
      });
    }
    return userList;
  }
}
