import 'package:ed_tech/helpers/custom_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../helpers/custom_colors.dart';
import '../../helpers/custom_themes.dart';

class ETPasswordInputField extends StatefulWidget {
  final TextEditingController textEditingController;
  const ETPasswordInputField({
    super.key,
    required this.textEditingController,
  });

  @override
  State<ETPasswordInputField> createState() => _ETPasswordInputFieldState();
}

class _ETPasswordInputFieldState extends State<ETPasswordInputField> {
  late bool isVisible;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isVisible = false;
  }

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
        obscureText: !isVisible,
        controller: widget.textEditingController,
        decoration: InputDecoration(
          labelText: "Password",
          labelStyle: ownTheme(context).pMedium,
          focusedBorder: borderDecoration,
          disabledBorder: borderDecoration,
          enabledBorder: borderDecoration,
          border: borderDecoration,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isVisible = !isVisible;
              });
            },
            icon: SvgPicture.asset(
              isVisible ? CustomIcons.visibleIcon : CustomIcons.notVisibleIcon,
            ),
          ),
        ),
      ),
    );
  }
}
