import 'package:ed_tech/services/user_service.dart';
import 'package:flutter/material.dart';

import '../../../helpers/et_scaffold_messenger.dart';

class EditPasswordProvider extends ChangeNotifier {
  TextEditingController newPasswordTextController = TextEditingController();
  TextEditingController confirmPasswordTextController = TextEditingController();

  Future<bool> saveNewPassword(
      {required BuildContext context, required String userId}) async {
    if (newPasswordTextController.text.isEmpty) {
      ETScaffoldMessenger.showMessage(
          context: context, messageText: "Please enter new password");
    } else if (confirmPasswordTextController.text.isEmpty) {
      ETScaffoldMessenger.showMessage(
          context: context, messageText: "Please confirm new password");
    } else if (newPasswordTextController.text !=
        confirmPasswordTextController.text) {
      ETScaffoldMessenger.showMessage(
          context: context, messageText: "Please enter the same passwords");
    } else if (newPasswordTextController.text.length < 5) {
      ETScaffoldMessenger.showMessage(
          context: context,
          messageText: "Please enter the password with 5 characters or more");
    } else {
      bool success = await UserService.editUserPasswordOnFirebase(
        userId: userId,
        newPassword: newPasswordTextController.text,
      );
      ETScaffoldMessenger.showMessage(
          context: context, messageText: success ? "Success" : "Try again");

      return success;
    }
    return false;
  }
}
