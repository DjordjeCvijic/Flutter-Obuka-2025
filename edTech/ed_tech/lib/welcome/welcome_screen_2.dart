import 'package:flutter/material.dart';

import '../helpers/custom_colors.dart';
import '../helpers/custom_images.dart';
import '../helpers/custom_themes.dart';
import '../widgets/ed_tech_button.dart';
import '../widgets/step_indicator/step_indicator.dart';
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
              onPressed: () {},
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
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          //column with text
                          spacing: 8,
                          children: [
                            Text(
                              "Find a course for you",
                              style: ownTheme(context)
                                  .heading4!
                                  .copyWith(color: CustomColors.dark),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "Quarantine is the perfect time to spend your day learning something new, from anywhere!",
                              style: ownTheme(context)
                                  .pMedium!
                                  .copyWith(color: CustomColors.darkGrey),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  StepIndicator(
                    currentIndex: 2,
                  ),
                ],
              ),
            ),
            EdTechButton(
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
