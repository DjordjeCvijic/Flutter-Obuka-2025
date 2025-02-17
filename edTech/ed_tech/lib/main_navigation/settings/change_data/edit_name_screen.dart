import 'package:ed_tech/helpers/custom_themes.dart';
import 'package:ed_tech/main_navigation/settings/change_data/edit_name_provider.dart';
import 'package:ed_tech/main_provider.dart';
import 'package:ed_tech/widgets/et_button.dart';
import 'package:ed_tech/widgets/input_fields/et_text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../helpers/et_scaffold_messenger.dart';
import '../../../widgets/et_circle_button.dart';

class EditNameScreen extends StatelessWidget {
  const EditNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MainProvider mainProvider =
        Provider.of<MainProvider>(context, listen: false);
    final EditNameProvider editNameProvider =
        Provider.of<EditNameProvider>(context, listen: false);
    editNameProvider.nameTextController.text = mainProvider.loggedUser.name;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: ETCircleButton(
                  topMargin: 16,
                  leftMargin: 16,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Text(
                "Edit Name",
                style: ownTheme(context).heading4,
              ),
              Gap(40),
              ETTextInputField(
                hintText: "Name",
                textEditingController: editNameProvider.nameTextController,
              ),
              ETButton(
                topMargin: 20,
                bottomMargin: 20,
                buttonText: "Save",
                onTapButton: () async {
                  mainProvider.loggedUser.name =
                      editNameProvider.nameTextController.text;

                  bool success = await editNameProvider.saveUserName(
                      user: mainProvider.loggedUser);
                  if (success) {
                    ETScaffoldMessenger.showMessage(
                        context: context, messageText: "Name edited");
                    Navigator.of(context).pop(true);
                  } else {
                    ETScaffoldMessenger.showMessage(
                        context: context, messageText: "Try again");
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
