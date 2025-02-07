import 'package:ed_tech/helpers/custom_colors.dart';
import 'package:ed_tech/helpers/custom_themes.dart';
import 'package:flutter/material.dart';

class ETTextInputField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  const ETTextInputField({
    super.key,
    required this.hintText,
    required this.textEditingController,
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
        controller: textEditingController,
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
