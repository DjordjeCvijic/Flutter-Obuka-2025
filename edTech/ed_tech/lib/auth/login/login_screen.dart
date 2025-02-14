import 'package:ed_tech/main_navigation/main_navigation.dart';
import 'package:ed_tech/helpers/custom_colors.dart';
import 'package:ed_tech/auth/login/login_provider.dart';
import 'package:ed_tech/auth/sign_up/sign_up_provider.dart';
import 'package:ed_tech/auth/sign_up/sign_up_screen.dart';
import 'package:ed_tech/main_provider.dart';
import 'package:ed_tech/widgets/et_button.dart';
import 'package:ed_tech/widgets/text_column.dart';
import 'package:ed_tech/widgets/input_fields/et_text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../helpers/custom_icons.dart';
import '../../helpers/custom_images.dart';
import '../../helpers/custom_themes.dart';
import '../../main_navigation/main_navigation_provider.dart';
import '../../models/user_model.dart';
import '../../widgets/input_fields/et_password_input_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginProvider provider =
        Provider.of<LoginProvider>(context, listen: false);
    final MainProvider mainProvider =
        Provider.of<MainProvider>(context, listen: false);
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
                  InkWell(
                    onTap: () async {
                      bool googleSignInSuccess =
                          await provider.googleSignIn(context: context);
                      if (googleSignInSuccess) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => ChangeNotifierProvider(
                              create: (context) => MainNavigationProvider(),
                              child: MainNavigation(),
                            ),
                          ),
                        );
                      }
                    },
                    child: SvgPicture.asset(CustomIcons.googleLoginIcon),
                  ),
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
                onTapButton: () async {
                  (bool, UserModel?) loginResult =
                      await provider.onLogIn(context: context);
                  if (loginResult.$1) {
                    mainProvider.loggedUser = loginResult.$2!;
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => ChangeNotifierProvider(
                          create: (context) => MainNavigationProvider(),
                          child: MainNavigation(),
                        ),
                      ),
                    );
                  }
                },
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(
                    MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider(
                        create: (context) => SignUpProvider(),
                        child: SignUpScreen(),
                      ),
                    ),
                  )
                      .then(
                    (value) {
                      if (value != null) {
                        provider.setUserDataInForm(
                            userEmail: (value as UserModel).email,
                            userPassword: value.password);
                      }
                    },
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
