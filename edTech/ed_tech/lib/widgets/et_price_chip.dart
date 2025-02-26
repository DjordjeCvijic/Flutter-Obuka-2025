import 'package:ed_tech/helpers/custom_themes.dart';
import 'package:flutter/widgets.dart';

import '../helpers/custom_colors.dart';

class PriceChip extends StatelessWidget {
  final String price;
  const PriceChip({
    super.key,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: CustomColors.secondary,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Text(
        "\$ $price",
        style:
            ownTheme(context).buttonSmall!.copyWith(color: CustomColors.white),
      ),
    );
  }
}
