import 'package:ed_tech/helpers/et_scaffold_messenger.dart';

import 'package:ed_tech/models/user_model.dart';
import 'package:flutter/material.dart';

import '../../services/user_service.dart';

class SignUpProvider extends ChangeNotifier {
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  Future<bool> onSignUp({required BuildContext context}) async {
    if (nameTextController.text.isEmpty ||
        emailTextController.text.isEmpty ||
        passwordTextController.text.isEmpty) {
      ETScaffoldMessenger.showMessage(
          context: context, messageText: "Some fields are empty");
    } else if (passwordTextController.text.length < 5) {
      ETScaffoldMessenger.showMessage(
          context: context, messageText: "Validation error");
    } else {
      List<UserModel> userList = await UserService.fetchUsersFromFirebase();

      if (userList.any((user) => user.email == emailTextController.text)) {
        ETScaffoldMessenger.showMessage(
            context: context, messageText: "Credentials error");
      } else {
        UserModel user = UserModel(
          name: nameTextController.text,
          email: emailTextController.text,
          password: passwordTextController.text,
        );

        bool success = await UserService.saveUserData(userData: user);

        if (success) {
          ETScaffoldMessenger.showMessage(
              context: context, messageText: "User date saved");
          return true;
        } else {
          ETScaffoldMessenger.showMessage(
              context: context, messageText: "ERROR");
        }
      }
    }
    return false;
  }
}
