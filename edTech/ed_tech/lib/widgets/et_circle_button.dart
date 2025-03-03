import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../helpers/custom_colors.dart';
import '../helpers/custom_icons.dart';

class ETCircleButton extends StatelessWidget {
  final double topMargin;
  final double leftMargin;
  final String iconPath;
  final double padding;
  final double size;
  final VoidCallback onTap;
  const ETCircleButton({
    super.key,
    required this.onTap,
    this.size = 48,
    this.padding = 16,
    this.iconPath = CustomIcons.leftArrowIcon,
    this.leftMargin = 0,
    this.topMargin = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: leftMargin, top: topMargin),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          onTap();
        },
        child: Container(
          padding: EdgeInsets.all(padding),
          height: size,
          width: size,
          decoration: BoxDecoration(
            border: Border.all(color: CustomColors.grey),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(iconPath),
        ),
      ),
    );
  }
}
