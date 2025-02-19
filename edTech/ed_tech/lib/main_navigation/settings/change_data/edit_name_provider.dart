import 'package:ed_tech/services/user_service.dart';
import 'package:flutter/material.dart';

class EditNameProvider extends ChangeNotifier {
  final TextEditingController nameTextController = TextEditingController();

  Future<bool> saveUserName({
    required String userId,
  }) async {
    if (nameTextController.text.isEmpty) {
      return false;
    } else {
      return UserService.editUserNameOnFirebase(
          userId: userId, newName: nameTextController.text);
    }
  }
}
