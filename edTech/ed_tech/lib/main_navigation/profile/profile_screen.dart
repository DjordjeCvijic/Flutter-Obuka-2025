import 'package:ed_tech/helpers/custom_images.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../auth/login/login_provider.dart';
import '../../auth/login/login_screen.dart';
import '../../helpers/custom_colors.dart';
import '../../helpers/custom_themes.dart';
import '../../services/user_service.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(4),
        Text(
          "Settings screen",
          style: ownTheme(context).heading4!.copyWith(color: CustomColors.dark),
        ),
        Gap(32),
        Image.asset(CustomImages.profileScreenImg),
        ElevatedButton(
          onPressed: () {
            UserService.setUserLoggedIn(false);
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider(
                  create: (context) => LoginProvider(),
                  child: LoginScreen(),
                ),
              ),
            );
          },
          child: Text("Log out"),
        )
      ],
    );
  }
}
