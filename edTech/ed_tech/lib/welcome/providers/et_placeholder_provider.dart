import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helpers/global_const.dart';

enum NextScreenEnum { welcomeScreen, loginScreen, mainNavigation }

class EtPlaceholderProvider extends ChangeNotifier {
  Future<NextScreenEnum> nextScreen() async {
    await Future.delayed(Duration(seconds: 2));
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    bool? firstTimeInApp = prefs.getBool(SharedPreferencesKeys.firstTime);
    if (firstTimeInApp == null) {
      prefs.setBool(SharedPreferencesKeys.firstTime, false);
      return NextScreenEnum.welcomeScreen;
    } else {
      bool? userLogged = prefs.getBool(SharedPreferencesKeys.loggedIn);
      if (userLogged == null || userLogged == false) {
        return NextScreenEnum.loginScreen;
      } else {
        return NextScreenEnum.mainNavigation;
      }
    }
  }
}
