import 'package:ed_tech/helpers/custom_icons.dart';
import 'package:ed_tech/helpers/custom_images.dart';
import 'package:ed_tech/helpers/custom_themes.dart';
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
          Image.asset(CustomImages.settingsScreen),
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
                PersonInfoBox(
                  title: "Name",
                  subtitle: mainProvider.loggedUser.name,
                  icon: CustomIcons.circleProfileIcon,
                ),
                PersonInfoBox(
                  title: "Email",
                  subtitle: mainProvider.loggedUser.email,
                  icon: CustomIcons.circleEmailIcon,
                ),
                PersonInfoBox(
                  title: "Password",
                  subtitle: "@gmail.com",
                  icon: CustomIcons.circlePasswordIcon,
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
