import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import '../../../helpers/global_const.dart';
import '../../../models/user_model.dart';

class EditNameProvider extends ChangeNotifier {
  final TextEditingController nameTextController = TextEditingController();

  Future<bool> saveUserName({required UserModel user}) async {
    log("New name: ${user.name}");
    log("User id: ${user.id}");
    String url = "${GlobalConst.firebaseURL}/user/${user.id!}.json";
    Response response = await http.put(
      Uri.parse(url),
      body: jsonEncode(
        user.toJson(),
      ),
    );
    if (response.statusCode != 200) {
      log("ERROR: ${response.body}");
    }

    return response.statusCode == 200;
  }
}
