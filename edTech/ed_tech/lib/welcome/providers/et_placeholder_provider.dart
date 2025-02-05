import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum NextScreenEnum { welcomeScreen, loginScreen }

class EtPlaceholderProvider extends ChangeNotifier {
  Future<NextScreenEnum> nextScreen() async {
    await Future.delayed(Duration(seconds: 2));
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    bool? firstTimeInApp = prefs.getBool("firstTime");
    if (firstTimeInApp == null) {
      prefs.setBool("firstTime", false);
      return NextScreenEnum.welcomeScreen;
    }

    return NextScreenEnum.loginScreen;
  }
}
