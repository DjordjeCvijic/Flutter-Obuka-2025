import 'dart:convert';
import 'dart:developer';

import 'package:ed_tech/helpers/et_scaffold_messenger.dart';
import 'package:ed_tech/helpers/global_const.dart';
import 'package:ed_tech/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class SignUpProvider extends ChangeNotifier {
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  Future<void> onSignUp({required BuildContext context}) async {
    if (nameTextController.text.isEmpty ||
        emailTextController.text.isEmpty ||
        passwordTextController.text.isEmpty) {
      ETScaffoldMessenger.showMessage(
          context: context, messageText: "Some fields are empty");
    } else if (passwordTextController.text.length < 5) {
      ETScaffoldMessenger.showMessage(
          context: context, messageText: "Validation error");
    } else {
      UserModel user = UserModel(
        name: nameTextController.text,
        email: emailTextController.text,
        password: passwordTextController.text,
      );
      String url = GlobalConst.firebaseURL + GlobalConst.userNode;

      Response response = await http.post(
        Uri.parse(url),
        body: jsonEncode(
          user.toJson(),
        ),
      );

      if (response.statusCode == 200) {
        ETScaffoldMessenger.showMessage(
            context: context, messageText: "User date saved");
      } else {
        ETScaffoldMessenger.showMessage(context: context, messageText: "ERROR");
        log(response.body);
      }
    }
  }
}
