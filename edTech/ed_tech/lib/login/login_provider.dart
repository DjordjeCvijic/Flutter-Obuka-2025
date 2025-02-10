import 'dart:developer';

import 'package:ed_tech/helpers/et_scaffold_messenger.dart';
import 'package:ed_tech/models/user_model.dart';
import 'package:ed_tech/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/global_const.dart';

class LoginProvider extends ChangeNotifier {
  final TextEditingController emailTextController = TextEditingController();

  final TextEditingController passwordTextController = TextEditingController();

  Future<bool> onLogIn({required BuildContext context}) async {
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
            final SharedPreferences prefs =
                await SharedPreferences.getInstance();
            prefs.setBool(SharedPreferencesKeys.loggedIn, true);
            return true;
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

    return false;
  }

  void googleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      log("PODACI SA GOOGLE-a${googleUser!.email}");
    } on Exception catch (e) {
      // TODO
      print('exception->$e');
    }
  }
}
