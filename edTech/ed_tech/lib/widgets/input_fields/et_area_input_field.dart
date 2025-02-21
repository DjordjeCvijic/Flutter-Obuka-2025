import 'package:flutter/material.dart';

import '../../helpers/custom_colors.dart';
import '../../helpers/custom_themes.dart';

class EtAreaInputField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  const EtAreaInputField({
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
        maxLines: 4,
        maxLength: 200,
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
