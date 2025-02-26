import 'package:flutter/material.dart';

class MainNavigationProvider extends ChangeNotifier {
  int currentIndex = 0;
  void refreshScreen(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }
}
