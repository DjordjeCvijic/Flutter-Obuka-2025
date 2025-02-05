import 'package:flutter/material.dart';

import '../helpers/custom_colors.dart';
import '../helpers/custom_themes.dart';

class TextColumn extends StatelessWidget {
  final String titleText;
  final String descriptionText;
  const TextColumn({
    super.key,
    required this.titleText,
    required this.descriptionText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        //column with text
        spacing: 8,
        children: [
          Text(
            titleText,
            style:
                ownTheme(context).heading4!.copyWith(color: CustomColors.dark),
            textAlign: TextAlign.center,
          ),
          Text(
            descriptionText,
            style: ownTheme(context)
                .pMedium!
                .copyWith(color: CustomColors.darkGrey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
