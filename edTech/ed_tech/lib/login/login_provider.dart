import 'dart:developer';

import 'package:ed_tech/helpers/et_scaffold_messenger.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  final TextEditingController emailTextController = TextEditingController();

  final TextEditingController passwordTextController = TextEditingController();

  void onLogIn({required BuildContext context}) {
    if (emailTextController.text.isEmpty ||
        passwordTextController.text.isEmpty) {
      ETScaffoldMessenger.showMessage(
          context: context, messageText: 'Please enter email and password');
    } else {
      log("email: ${emailTextController.text}");
      log("password: ${passwordTextController.text}");
    }
  }
}
