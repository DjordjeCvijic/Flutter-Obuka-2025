import 'package:ed_tech/helpers/custom_images.dart';
import 'package:ed_tech/auth/sign_up/sign_up_provider.dart';
import 'package:ed_tech/widgets/et_button.dart';
import 'package:ed_tech/widgets/input_fields/et_password_input_field.dart';
import 'package:ed_tech/widgets/input_fields/et_text_input_field.dart';
import 'package:ed_tech/widgets/text_column.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helpers/custom_colors.dart';
import '../../helpers/custom_themes.dart';
import '../../widgets/et_circle_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpProvider provider =
        Provider.of<SignUpProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            spacing: 16,
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
              Image.asset(CustomImages.signUpImg),
              TextColumn(
                titleText: "Sign up",
                descriptionText: "Create your account",
              ),
              ETTextInputField(
                hintText: "Name",
                textEditingController: provider.nameTextController,
              ),
              ETTextInputField(
                hintText: "Email",
                textEditingController: provider.emailTextController,
              ),
              ETPasswordInputField(
                textEditingController: provider.passwordTextController,
              ),
              ETButton(
                topMargin: 0,
                bottomMargin: 0,
                leftMargin: 16,
                rightMargin: 16,
                buttonText: "Sign up",
                onTapButton: () async {
                  bool success = await provider.onSignUp(context: context);
                  if (success) {
                    Navigator.of(context).pop();
                  }
                },
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Log in",
                  style: ownTheme(context)
                      .buttonSmall!
                      .copyWith(color: CustomColors.darkGrey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
