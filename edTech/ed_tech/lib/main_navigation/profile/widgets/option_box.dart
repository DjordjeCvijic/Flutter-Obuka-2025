import 'package:ed_tech/helpers/custom_colors.dart';
import 'package:ed_tech/helpers/custom_themes.dart';
import 'package:flutter/material.dart';

class OptionBox extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const OptionBox({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        margin: EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: CustomColors.grey),
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style:
                ownTheme(context).heading4!.copyWith(color: CustomColors.dark),
          ),
        ),
      ),
    );
  }
}
