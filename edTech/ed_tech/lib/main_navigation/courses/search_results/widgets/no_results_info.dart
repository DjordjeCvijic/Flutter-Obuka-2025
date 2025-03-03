import 'package:ed_tech/helpers/custom_colors.dart';
import 'package:ed_tech/helpers/custom_themes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../helpers/custom_images.dart';

class NoResultsInfo extends StatelessWidget {
  const NoResultsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            Image.asset(CustomImages.noResultsImg),
            Gap(32),
            Text(
              " Course not found",
              style: ownTheme(context)
                  .heading4!
                  .copyWith(color: CustomColors.dark),
            ),
            Gap(8),
            Text("Try searching the course with a different keyword",
                style: ownTheme(context)
                    .pMedium!
                    .copyWith(color: CustomColors.darkGrey),
                textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
