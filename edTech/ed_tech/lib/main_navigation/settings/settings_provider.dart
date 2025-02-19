import 'package:ed_tech/helpers/global_const.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timeago/timeago.dart' as timeago;

class SettingsProvider extends ChangeNotifier {
  Future<bool> checkNotificationFlag() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? notificationFlag =
        prefs.getBool(SharedPreferencesKeys.notificationFlag);
    if (notificationFlag == null) {
      prefs.setBool(SharedPreferencesKeys.notificationFlag, true);
      return true;
    } else {
      return notificationFlag;
    }
  }

  setNotificationFlag({required bool notificationFlag}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(SharedPreferencesKeys.notificationFlag, notificationFlag);
  }

  void refreshUI() {
    notifyListeners();
  }

  String getTimeAgo(String? timeAsString) {
    if (timeAsString == null) {
      return "";
    } else {
      return "changed ${timeago.format(DateTime.parse(timeAsString))}";
    }
  }
}
