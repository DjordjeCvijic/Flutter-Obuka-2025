import 'package:ed_tech/main_navigation/courses/courses_provider.dart';
import 'package:ed_tech/main_navigation/courses/courses_screen.dart';
import 'package:ed_tech/main_navigation/main_navigation_provider.dart';
import 'package:ed_tech/main_navigation/profile/profile_screen.dart';
import 'package:ed_tech/main_navigation/settings/settings_provider.dart';
import 'package:ed_tech/main_navigation/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../auth/login/login_provider.dart';
import '../auth/login/login_screen.dart';
import '../helpers/custom_colors.dart';
import '../helpers/custom_icons.dart';
import '../helpers/custom_themes.dart';
import '../services/user_service.dart';

class MainNavigation extends StatelessWidget {
  const MainNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    MainNavigationProvider provider =
        Provider.of<MainNavigationProvider>(context, listen: false);

    List<Widget> screens = [
      ChangeNotifierProvider(
        create: (context) => CoursesProvider(),
        child: CoursesScreen(),
      ),
      ProfileScreen(),
      ChangeNotifierProvider(
        create: (context) => SettingsProvider(),
        child: SettingsScreen(),
      )
    ];

    String getAppBarTitle() {
      String appBarTitle = "";
      if (provider.currentIndex == 0) {
        appBarTitle = "Hello,";
      } else if (provider.currentIndex == 1) {
        appBarTitle = "Profile";
      } else {
        appBarTitle = "Settings screen";
      }
      return appBarTitle;
    }

    return Consumer<MainNavigationProvider>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text(getAppBarTitle()),
          centerTitle: provider.currentIndex != 0,
        ),
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
        drawer: Drawer(
          width: MediaQuery.sizeOf(context).width * 0.5,
          child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'Courses',
                    style: ownTheme(context).heading4!.copyWith(
                        color: provider.currentIndex == 0
                            ? CustomColors.primary
                            : null),
                  ),
                  onTap: () {
                    provider.refreshScreen(0);
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: Text(
                    'Profile',
                    style: ownTheme(context).heading4!.copyWith(
                        color: provider.currentIndex == 1
                            ? CustomColors.primary
                            : null),
                  ),
                  onTap: () {
                    provider.refreshScreen(1);
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: Text(
                    'Settings',
                    style: ownTheme(context).heading4!.copyWith(
                        color: provider.currentIndex == 2
                            ? CustomColors.primary
                            : null),
                  ),
                  onTap: () {
                    provider.refreshScreen(2);
                    Navigator.of(context).pop();
                  },
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'Log out',
                    style: ownTheme(context).pLarge,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
