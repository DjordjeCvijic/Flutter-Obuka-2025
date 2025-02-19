import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../helpers/custom_colors.dart';
import '../../../helpers/custom_icons.dart';
import '../../../helpers/custom_themes.dart';

class PersonInfoBox extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final bool showRightIcon;
  const PersonInfoBox({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.showRightIcon = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(top: 16),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: CustomColors.grey),
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(icon),
            Gap(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: ownTheme(context)
                        .heading5!
                        .copyWith(color: CustomColors.dark),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    subtitle,
                    style: ownTheme(context)
                        .pMedium!
                        .copyWith(color: CustomColors.darkGrey),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            if (showRightIcon) SvgPicture.asset(CustomIcons.rightArrowIcon)
          ],
        ),
      ),
    );
  }
}
