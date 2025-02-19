import 'package:ed_tech/main_navigation/settings/change_data/edit_password_provider.dart';
import 'package:ed_tech/widgets/input_fields/et_password_input_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../helpers/custom_themes.dart';
import '../../../main_provider.dart';
import '../../../widgets/et_button.dart';
import '../../../widgets/et_circle_button.dart';

class EditPasswordScreen extends StatelessWidget {
  const EditPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MainProvider mainProvider =
        Provider.of<MainProvider>(context, listen: false);
    final EditPasswordProvider editPasswordProvider =
        Provider.of<EditPasswordProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ETCircleButton(
                topMargin: 16,
                leftMargin: 16,
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Edit Password",
                  style: ownTheme(context).heading4,
                ),
              ),
              Gap(40),
              ETPasswordInputField(
                hintText: "Enter new password",
                textEditingController:
                    editPasswordProvider.newPasswordTextController,
              ),
              Gap(20),
              ETPasswordInputField(
                hintText: "Confirm new password",
                textEditingController:
                    editPasswordProvider.confirmPasswordTextController,
              ),
              ETButton(
                topMargin: 20,
                bottomMargin: 20,
                buttonText: "Save",
                onTapButton: () async {
                  bool success = await editPasswordProvider.saveNewPassword(
                      context: context, userId: mainProvider.loggedUser.id!);
                  if (success) {
                    mainProvider.loggedUser.password =
                        editPasswordProvider.newPasswordTextController.text;
                    mainProvider.loggedUser.passwordChangedAt =
                        DateTime.now().toIso8601String();
                    Navigator.of(context).pop(true);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
