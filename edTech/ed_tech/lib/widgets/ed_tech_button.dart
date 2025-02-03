import 'package:ed_tech/helpers/custom_colors.dart';
import 'package:ed_tech/helpers/custom_themes.dart';
import 'package:flutter/material.dart';

class EdTechButton extends StatelessWidget {
  final String buttonText;
  final double topMargin;
  final double bottomMargin;
  final VoidCallback onTapButton;
  const EdTechButton({
    super.key,
    required this.topMargin,
    required this.bottomMargin,
    required this.buttonText,
    required this.onTapButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(32, topMargin, 32, bottomMargin),
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
