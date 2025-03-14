import 'package:ed_tech/helpers/custom_images.dart';
import 'package:ed_tech/main_navigation/profile/my_courses/my_courses_provider.dart';
import 'package:ed_tech/main_navigation/profile/my_courses/my_courses_screen.dart';
import 'package:ed_tech/main_navigation/profile/payment/payment_screen.dart';
import 'package:ed_tech/main_navigation/profile/saved_courses/saved_courses_provider.dart';
import 'package:ed_tech/main_navigation/profile/saved_courses/saved_courses_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../auth/login/login_provider.dart';
import '../../auth/login/login_screen.dart';
import '../../helpers/custom_colors.dart';
import '../../helpers/custom_themes.dart';
import '../../services/user_service.dart';
import 'widgets/option_box.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Gap(32),
          Column(
            spacing: 16,
            children: [
              Image.asset(CustomImages.profileScreenImg),
              OptionBox(
                text: "My Courses",
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider(
                        create: (context) => MyCoursesProvider(),
                        child: MyCoursesScreen(),
                      ),
                    ),
                  );
                },
              ),
              OptionBox(
                text: "Saved",
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider(
                        create: (context) => SavedCoursesProvider(),
                        child: SavedCoursesScreen(),
                      ),
                    ),
                  );
                },
              ),
              OptionBox(
                text: "Payment",
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PaymentScreen()
                        // ChangeNotifierProvider(
                        //   create: (context) => SavedCoursesProvider(),
                        //   child: SavedCoursesScreen(),
                        // ),
                        ),
                  );
                },
              ),
              TextButton(
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
                child: Text(
                  "Log out",
                  style: ownTheme(context)
                      .buttonSmall!
                      .copyWith(color: CustomColors.darkGrey),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
