import 'package:flutter/material.dart';
import 'package:my_first_app/helpers/custom_colors.dart';

class CustomThemes {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.amber,
    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontSize: 25,
        color: Colors.grey[700],
        fontWeight: FontWeight.w900,
      ),
      titleSmall: TextStyle(
        fontSize: 25,
        color: CustomColors.red,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
