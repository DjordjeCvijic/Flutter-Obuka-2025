import 'package:ed_tech/widgets/text_column.dart';
import 'package:flutter/material.dart';

import '../helpers/custom_images.dart';
import '../helpers/custom_themes.dart';
import '../login/login_screen.dart';
import '../widgets/et_button.dart';
import '../widgets/step_indicator/step_indicator.dart';

class WelcomeScreen3 extends StatelessWidget {
  const WelcomeScreen3({super.key});

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
                    builder: (context) => LoginScreen(),
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
                  Image.asset(CustomImages.welcome3Img),
                  Expanded(
                    child: SingleChildScrollView(
                        child: TextColumn(
                            titleText: "Improve your skills",
                            descriptionText:
                                "Quarantine is the perfect time to spend your day learning something new, from anywhere!")),
                  ),
                  StepIndicator(
                    currentIndex: 3,
                  ),
                ],
              ),
            ),
            ETButton(
              topMargin: 0,
              bottomMargin: 24,
              buttonText: "Let’s Start",
              onTapButton: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                  (route) => false,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
