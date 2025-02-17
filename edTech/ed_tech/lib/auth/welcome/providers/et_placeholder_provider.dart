import 'package:ed_tech/models/user_model.dart';
import 'package:ed_tech/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../helpers/global_const.dart';

enum NextScreenEnum { welcomeScreen, loginScreen, mainNavigation }

class EtPlaceholderProvider extends ChangeNotifier {
  Future<(NextScreenEnum, UserModel?)> nextScreen() async {
    await Future.delayed(Duration(seconds: 2));
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    bool? firstTimeInApp = prefs.getBool(SharedPreferencesKeys.firstTime);
    if (firstTimeInApp == null) {
      prefs.setBool(SharedPreferencesKeys.firstTime, false);
      return (NextScreenEnum.welcomeScreen, null);
    } else {
      bool? userLogged = prefs.getBool(SharedPreferencesKeys.loggedIn);
      if (userLogged == null || userLogged == false) {
        return (NextScreenEnum.loginScreen, null);
      } else {
        String? userEmail = await UserService.readEmailFromSP();
        List<UserModel> users = await UserService.fetchUsersFromFirebase();
        UserModel user = users.firstWhere(
          (element) => element.email == userEmail,
        );

        return (NextScreenEnum.mainNavigation, user);
      }
    }
  }
}
