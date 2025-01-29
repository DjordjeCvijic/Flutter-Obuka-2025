import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_first_app/models/person_model.dart';

class PersonInfoProvider extends ChangeNotifier {
  PersonModel personModel;
  TextEditingController firstNameTextController = TextEditingController();
  TextEditingController lastNameTextController = TextEditingController();

  PersonInfoProvider({required this.personModel});

  void printDate() {
    log("Data: ${firstNameTextController.text} ${lastNameTextController.text}");
  }

  void saveDate() {
    personModel.firstName = firstNameTextController.text;
    personModel.lastName = lastNameTextController.text;
    firstNameTextController.clear();
    lastNameTextController.clear();
    notifyListeners();
  }
}
