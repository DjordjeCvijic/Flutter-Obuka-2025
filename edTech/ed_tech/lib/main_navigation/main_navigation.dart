import 'package:ed_tech/main_navigation/main_navigation_provider.dart';
import 'package:ed_tech/main_navigation/profile/profile_screen.dart';
import 'package:ed_tech/main_navigation/settings/settings_provider.dart';
import 'package:ed_tech/main_navigation/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../helpers/custom_colors.dart';
import '../helpers/custom_icons.dart';

class MainNavigation extends StatelessWidget {
  const MainNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    MainNavigationProvider provider =
        Provider.of<MainNavigationProvider>(context, listen: false);

    List<Widget> screens = [
      Text("Screen 1"),
      ProfileScreen(),
      ChangeNotifierProvider(
        create: (context) => SettingsProvider(),
        child: SettingsScreen(),
      )
    ];

    return Consumer<MainNavigationProvider>(
      builder: (context, value, child) => Scaffold(
        body: SafeArea(
          child: screens.elementAt(provider.currentIndex),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              topLeft: Radius.circular(16),
            ),
            border: Border.all(
              color: CustomColors.grey,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
            child: BottomNavigationBar(
              currentIndex: provider.currentIndex,
              onTap: (index) {
                provider.refreshScreen(index);
              },
              selectedItemColor: CustomColors.primary,
              unselectedItemColor: CustomColors.grey,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    CustomIcons.coursesIcon,
                    colorFilter: provider.currentIndex == 0
                        ? ColorFilter.mode(
                            CustomColors.primary, BlendMode.srcIn)
                        : null,
                  ),
                  label: "Courses",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    CustomIcons.profileIcon,
                    colorFilter: provider.currentIndex == 1
                        ? ColorFilter.mode(
                            CustomColors.primary, BlendMode.srcIn)
                        : null,
                  ),
                  label: "Profile",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    CustomIcons.settingsIcon,
                    colorFilter: provider.currentIndex == 2
                        ? ColorFilter.mode(
                            CustomColors.primary, BlendMode.srcIn)
                        : null,
                  ),
                  label: "Settings",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
