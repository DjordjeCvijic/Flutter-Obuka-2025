import 'package:flutter/material.dart';

class MainNavigationProvider extends ChangeNotifier {
  int currentIndex = 2;
  void refreshScreen(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }
}
