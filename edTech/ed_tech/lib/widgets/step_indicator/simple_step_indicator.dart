import 'package:flutter/material.dart';

import '../../helpers/custom_colors.dart';

class SimpleStepIndicator extends StatelessWidget {
  const SimpleStepIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        color: CustomColors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}
