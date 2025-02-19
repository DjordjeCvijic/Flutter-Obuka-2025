import 'package:flutter/material.dart';

class ETScaffoldMessenger {
  static void showMessage(
      {required BuildContext context, required String messageText}) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(messageText),
      ),
    );
  }
}
