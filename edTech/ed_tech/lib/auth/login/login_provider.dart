import 'dart:developer';

import 'package:ed_tech/helpers/et_scaffold_messenger.dart';
import 'package:ed_tech/models/user_model.dart';
import 'package:ed_tech/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginProvider extends ChangeNotifier {
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  Future<(bool, UserModel?)> onLogIn({required BuildContext context}) async {
    if (emailTextController.text.isEmpty ||
        passwordTextController.text.isEmpty) {
      ETScaffoldMessenger.showMessage(
          context: context, messageText: 'Please enter email and password');
    } else {
      List<UserModel> userList = await UserService.fetchUsersFromFirebase();

      if (userList.isNotEmpty) {
        if (userList.any((user) => user.email == emailTextController.text)) {
          UserModel user = userList.firstWhere(
              (userElement) => userElement.email == emailTextController.text);

          if (user.password == passwordTextController.text) {
            //Login success
            UserService.setUserLoggedIn(true);
            UserService.writeEmailToSP(email: emailTextController.text);
            return (true, user);
          } else {
            ETScaffoldMessenger.showMessage(
                context: context, messageText: 'Wrong credentials');
          }
        } else {
          ETScaffoldMessenger.showMessage(
              context: context, messageText: 'Wrong credentials');
        }
      } else {
        ETScaffoldMessenger.showMessage(
            context: context, messageText: 'No registered users');
      }
    }

    return (false, null);
  }

  Future<bool> googleSignIn({required BuildContext context}) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        UserModel userModel = UserModel(
          email: googleUser.email,
          name: googleUser.displayName ?? "",
          password: googleUser.id,
        );
        GoogleSignIn().signOut();

        List<UserModel> users = await UserService.fetchUsersFromFirebase();

        if (users.any((user) => user.email == userModel.email)) {
          //User already exists in database
          bool checkResponse = _checkUserPassword(users, userModel);
          if (checkResponse) {
            UserService.setUserLoggedIn(true);
            UserService.writeEmailToSP(email: userModel.email);
          }
          return checkResponse;
        } else {
          return _saveUserData(userModel: userModel, context: context);
        }
      } else {
        ETScaffoldMessenger.showMessage(
            context: context, messageText: "Please, select user");
      }
    } on Exception catch (e) {
      log('exception->$e');
    }
    return false;
  }

  bool _checkUserPassword(List<UserModel> users, UserModel userModel) {
    UserModel userInDatabase =
        users.firstWhere((user) => user.email == userModel.email);

    return userInDatabase.password == userModel.password;
  }

  Future<bool> _saveUserData(
      {required UserModel userModel, required BuildContext context}) async {
    bool success =
        await UserService.saveUserDataOnFirebase(userData: userModel);

    if (success) {
      ETScaffoldMessenger.showMessage(
          context: context, messageText: "User date saved");
    } else {
      ETScaffoldMessenger.showMessage(context: context, messageText: "ERROR");
    }

    return success;
  }

  void setUserDataInForm({
    required String userEmail,
    required String userPassword,
  }) {
    emailTextController.text = userEmail;
    passwordTextController.text = userPassword;
  }
}
