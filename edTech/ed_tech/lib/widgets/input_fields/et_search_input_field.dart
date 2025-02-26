import 'package:ed_tech/helpers/custom_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../helpers/custom_colors.dart';
import '../../helpers/custom_themes.dart';

class EtSearchInputField extends StatelessWidget {
  final VoidCallback? onSearchIconTap;
  final TextEditingController textEditingController;
  final String hintText;
  const EtSearchInputField({
    super.key,
    required this.hintText,
    this.onSearchIconTap,
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
      margin: EdgeInsets.symmetric(vertical: 12),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          labelText: hintText,
          labelStyle: ownTheme(context).pMedium,
          focusedBorder: borderDecoration,
          disabledBorder: borderDecoration,
          enabledBorder: borderDecoration,
          border: borderDecoration,
          suffixIcon: InkWell(
            onTap: onSearchIconTap,
            child: Container(
              margin: EdgeInsets.all(16),
              child: SvgPicture.asset(
                CustomIcons.searchIcon,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
