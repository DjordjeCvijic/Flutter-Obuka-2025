import 'package:ed_tech/helpers/custom_images.dart';
import 'package:ed_tech/helpers/custom_themes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(CustomImages.welcomeImg),
              Gap(16),
              Text(
                "CodeFactory",
                style: ownTheme(context).heading2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
