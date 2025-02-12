import 'package:ed_tech/widgets/text_column.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helpers/custom_images.dart';
import '../../helpers/custom_themes.dart';
import '../login/login_provider.dart';
import '../login/login_screen.dart';
import '../../widgets/et_button.dart';
import '../../widgets/step_indicator/step_indicator.dart';
import 'welcome_screen_3.dart';

class WelcomeScreen2 extends StatelessWidget {
  const WelcomeScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          //first column
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,

          children: [
            TextButton(
              onPressed: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => LoginScreen(),
                //   ),
                // );
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider(
                      create: (context) => LoginProvider(),
                      child: LoginScreen(),
                    ),
                  ),
                  (route) => false,
                );
              },
              child: Text(
                "Skip",
                style: ownTheme(context).buttonSmall,
              ),
            ),
            Expanded(
              child: Column(
                spacing: 16,
                children: [
                  Image.asset(CustomImages.welcome2Img),
                  Expanded(
                    child: SingleChildScrollView(
                      child: TextColumn(
                          titleText: "Find a course for you",
                          descriptionText:
                              "Quarantine is the perfect time to spend your day learning something new, from anywhere!"),
                    ),
                  ),
                  StepIndicator(
                    currentIndex: 2,
                  ),
                ],
              ),
            ),
            ETButton(
              topMargin: 0,
              bottomMargin: 24,
              buttonText: "Next",
              onTapButton: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => WelcomeScreen3(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
