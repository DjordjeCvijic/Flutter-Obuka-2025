import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';

import 'custom_colors.dart';

class CustomLoadingIndicator {
  static Future<void> callMethodWithLoadingIndicator({
    required BuildContext context,
    required Function callback,
    Function? onFinished,
  }) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        child: PopScope(
          canPop: false,
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SpinKitWave(
                  color: CustomColors.primary,
                  size: 50.0,
                ),
                Gap(8),
                Text("LOADING"),
              ],
            ),
          ),
        ),
      ),
    );
    await callback();

    Navigator.of(context).pop();
    if (onFinished != null) {
      onFinished();
    }
  }
}
