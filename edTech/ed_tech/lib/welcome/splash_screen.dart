import 'package:ed_tech/helpers/custom_icons.dart';
import 'package:ed_tech/helpers/custom_images.dart';
import 'package:ed_tech/helpers/custom_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SvgPicture.asset(
              CustomIcons.hatIcon,
              height: 100,
            ),
            Image.asset(CustomImages.welcomeImg),
            Text(
              "CodeFactory",
              style: ownTheme(context).heading2,
            ),
          ],
        ),
      )),
    );
  }
}
