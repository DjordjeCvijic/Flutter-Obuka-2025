import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

import '../helpers/custom_colors.dart';
import '../helpers/custom_themes.dart';
import 'et_circle_button.dart';

class ETTitleWithBackButton extends StatelessWidget {
  final String title;
  const ETTitleWithBackButton({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ETCircleButton(
          size: 40,
          padding: 12,
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        Expanded(
          child: Text(
            title,
            style: ownTheme(context).heading4!.copyWith(
                  color: CustomColors.dark,
                ),
            textAlign: TextAlign.center,
          ),
        ),
        Gap(40),
      ],
    );
  }
}
