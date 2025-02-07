import 'package:ed_tech/helpers/custom_colors.dart';
import 'package:ed_tech/login/login_provider.dart';
import 'package:ed_tech/sign_up/sign_up_provider.dart';
import 'package:ed_tech/sign_up/sign_up_screen.dart';
import 'package:ed_tech/widgets/et_button.dart';
import 'package:ed_tech/widgets/text_column.dart';
import 'package:ed_tech/widgets/input_fields/et_text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../helpers/custom_icons.dart';
import '../helpers/custom_images.dart';
import '../helpers/custom_themes.dart';
import '../widgets/input_fields/et_password_input_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginProvider provider =
        Provider.of<LoginProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Gap(52),
              SizedBox(
                height: 253,
                child: Image.asset(CustomImages.loginImg),
              ),
              Gap(16),
              TextColumn(
                titleText: "Log in",
                descriptionText: "Login with social networks",
              ),
              Gap(8),
              Row(
                spacing: 12,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(CustomIcons.facebookLoginIcon),
                  SvgPicture.asset(CustomIcons.instagramLoginIcon),
                  SvgPicture.asset(CustomIcons.googleLoginIcon),
                ],
              ),
              Gap(16),
              ETTextInputField(
                textEditingController: provider.emailTextController,
                hintText: "Email",
              ),
              Gap(12),
              ETPasswordInputField(
                textEditingController: provider.passwordTextController,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot Password?",
                  style: ownTheme(context)
                      .buttonSmall!
                      .copyWith(color: CustomColors.darkGrey),
                ),
              ),
              ETButton(
                topMargin: 0,
                bottomMargin: 0,
                leftMargin: 16,
                rightMargin: 16,
                buttonText: "Log in",
                onTapButton: () {
                  provider.onLogIn(context: context);
                },
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider(
                        create: (context) => SignUpProvider(),
                        child: SignUpScreen(),
                      ),
                    ),
                  );
                },
                child: Text(
                  "Sign up",
                  style: ownTheme(context)
                      .buttonSmall!
                      .copyWith(color: CustomColors.darkGrey),
                ),
              ),
              Gap(50)
            ],
          ),
        ),
      ),
    );
  }
}
