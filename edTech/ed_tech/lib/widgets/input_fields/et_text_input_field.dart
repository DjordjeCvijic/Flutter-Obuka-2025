import 'package:ed_tech/helpers/custom_colors.dart';
import 'package:ed_tech/helpers/custom_themes.dart';
import 'package:flutter/material.dart';

class ETTextInputField extends StatelessWidget {
  final String hintText;
  const ETTextInputField({
    super.key,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder borderDecoration = OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(12),
      ),
      borderSide: BorderSide(color: CustomColors.grey),
    );
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        decoration: InputDecoration(
          labelText: hintText,
          labelStyle: ownTheme(context).pMedium,
          focusedBorder: borderDecoration,
          disabledBorder: borderDecoration,
          enabledBorder: borderDecoration,
          border: borderDecoration,
        ),
      ),
    );
  }
}
