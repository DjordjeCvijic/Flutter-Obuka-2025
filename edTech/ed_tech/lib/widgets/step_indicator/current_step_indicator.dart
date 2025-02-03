import 'package:flutter/material.dart';

import '../../helpers/custom_colors.dart';

class CurrentStepIndicator extends StatelessWidget {
  const CurrentStepIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: 16,
      decoration: BoxDecoration(
        color: CustomColors.secondary,
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
      ),
    );
  }
}
