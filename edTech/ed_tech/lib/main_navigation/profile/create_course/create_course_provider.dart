import 'package:flutter/material.dart';

class CreateCourseProvider extends ChangeNotifier {
  final TextEditingController courseNameController = TextEditingController();
  final TextEditingController courseDescriptionController =
      TextEditingController();
  final TextEditingController coursePriceController = TextEditingController();

  Duration duration = Duration(hours: 0, minutes: 0);

  void setDuration({required Duration newDuration}) {
    duration = newDuration;
    notifyListeners();
  }
}
