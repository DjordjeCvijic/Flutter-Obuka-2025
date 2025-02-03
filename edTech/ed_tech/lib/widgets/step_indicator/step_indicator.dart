import 'package:ed_tech/widgets/step_indicator/current_step_indicator.dart';
import 'package:ed_tech/widgets/step_indicator/simple_step_indicator.dart';
import 'package:flutter/material.dart';

class StepIndicator extends StatelessWidget {
  final int currentIndex;
  const StepIndicator({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 12,
      children: [
        currentIndex == 1 ? CurrentStepIndicator() : SimpleStepIndicator(),
        currentIndex == 2 ? CurrentStepIndicator() : SimpleStepIndicator(),
        currentIndex == 3 ? CurrentStepIndicator() : SimpleStepIndicator(),
      ],
    );
  }
}
