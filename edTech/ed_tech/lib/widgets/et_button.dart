import 'package:ed_tech/helpers/custom_colors.dart';
import 'package:ed_tech/helpers/custom_themes.dart';
import 'package:flutter/material.dart';

class ETButton extends StatelessWidget {
  final String buttonText;
  final double topMargin;
  final double bottomMargin;
  final double leftMargin;
  final double rightMargin;
  final VoidCallback onTapButton;
  const ETButton({
    super.key,
    required this.topMargin,
    required this.bottomMargin,
    required this.buttonText,
    required this.onTapButton,
    this.leftMargin = 32,
    this.rightMargin = 32,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.fromLTRB(leftMargin, topMargin, rightMargin, bottomMargin),
      child: InkWell(
        onTap: () {
          onTapButton();
        },
        child: Container(
          height: 56,
          width: double.infinity,
          decoration: BoxDecoration(
            color: CustomColors.primary,
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: Center(
            child: Text(
              buttonText,
              style: ownTheme(context)
                  .buttonMedium!
                  .copyWith(color: CustomColors.white),
            ),
          ),
        ),
      ),
    );
  }
}
