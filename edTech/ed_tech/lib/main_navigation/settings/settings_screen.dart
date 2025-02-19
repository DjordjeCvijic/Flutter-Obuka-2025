import 'package:ed_tech/helpers/custom_icons.dart';
import 'package:ed_tech/helpers/custom_images.dart';
import 'package:ed_tech/helpers/custom_themes.dart';
import 'package:ed_tech/main_navigation/settings/change_data/edit_name_provider.dart';
import 'package:ed_tech/main_navigation/settings/change_data/edit_name_screen.dart';
import 'package:ed_tech/main_navigation/settings/change_data/edit_password_provider.dart';
import 'package:ed_tech/main_navigation/settings/change_data/edit_password_screen.dart';
import 'package:ed_tech/main_navigation/settings/settings_provider.dart';
import 'package:ed_tech/main_navigation/settings/widgets/notifications_box.dart';
import 'package:ed_tech/main_navigation/settings/widgets/person_info_box.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../helpers/custom_colors.dart';
import '../../main_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MainProvider mainProvider =
        Provider.of<MainProvider>(context, listen: false);
    final SettingsProvider settingsProvider =
        Provider.of<SettingsProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        children: [
          Gap(4),
          Text(
            "Settings screen",
            style:
                ownTheme(context).heading4!.copyWith(color: CustomColors.dark),
          ),
          Gap(20),
          Image.asset(CustomImages.settingsScreenImg),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NotificationsBox(),
                Text(
                  "Account information",
                  style: ownTheme(context)
                      .heading5!
                      .copyWith(color: CustomColors.dark),
                ),
                Consumer<SettingsProvider>(
                  builder: (context, value, child) => PersonInfoBox(
                    title: "Name",
                    subtitle: mainProvider.loggedUser.name,
                    icon: CustomIcons.circleProfileIcon,
                    onTap: () {
                      Navigator.of(context)
                          .push(
                        MaterialPageRoute(
                          builder: (context) => ChangeNotifierProvider(
                            create: (context) => EditNameProvider(),
                            child: EditNameScreen(),
                          ),
                        ),
                      )
                          .then(
                        (value) {
                          if (value != null && value) {
                            settingsProvider.refreshUI();
                          }
                        },
                      );
                    },
                  ),
                ),
                PersonInfoBox(
                  title: "Email",
                  subtitle: mainProvider.loggedUser.email,
                  icon: CustomIcons.circleEmailIcon,
                  showRightIcon: false,
                ),
                Consumer<SettingsProvider>(
                  builder: (context, value, child) => PersonInfoBox(
                    title: "Password",
                    subtitle: settingsProvider
                        .getTimeAgo(mainProvider.loggedUser.passwordChangedAt),
                    icon: CustomIcons.circlePasswordIcon,
                    onTap: () {
                      Navigator.of(context)
                          .push(
                        MaterialPageRoute(
                          builder: (context) => ChangeNotifierProvider(
                            create: (context) => EditPasswordProvider(),
                            child: EditPasswordScreen(),
                          ),
                        ),
                      )
                          .then(
                        (value) {
                          if (value != null && value) {
                            settingsProvider.refreshUI();
                          }
                        },
                      );
                    },
                  ),
                ),
                Gap(20)
              ],
            ),
          )
        ],
      ),
    );
  }
}
