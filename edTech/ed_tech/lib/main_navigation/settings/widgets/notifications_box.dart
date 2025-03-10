import 'package:ed_tech/helpers/custom_themes.dart';
import 'package:ed_tech/main_navigation/settings/settings_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../helpers/custom_colors.dart';
import '../../../helpers/custom_icons.dart';
import 'et_switch.dart';

class NotificationsBox extends StatelessWidget {
  const NotificationsBox({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsProvider settingsProvider =
        Provider.of<SettingsProvider>(context, listen: false);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      margin: EdgeInsets.symmetric(vertical: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: CustomColors.grey),
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(CustomIcons.circleNotificationIcon),
          Gap(12),
          Expanded(
            child: Text(
              "Notifications",
              style: ownTheme(context)
                  .heading5!
                  .copyWith(color: CustomColors.dark),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          FutureBuilder(
            future: settingsProvider.checkNotificationFlag(),
            builder: (context, snapshot) =>
                snapshot.connectionState == ConnectionState.waiting
                    ? EtSwitch(
                        initValue: false,
                      )
                    : EtSwitch(
                        key: UniqueKey(),
                        initValue: snapshot.data!,
                      ),
          )
        ],
      ),
    );
  }
}
