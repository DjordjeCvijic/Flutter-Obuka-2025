import 'package:ed_tech/helpers/custom_colors.dart';
import 'package:flutter/material.dart';

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
        fontWeight: FontWeight.w500,
      ),
    ),
  )..addOwn(
      const OwnThemeFields(
        heading1: TextStyle(
          fontSize: 56.0,
          fontWeight: FontWeight.w700,
          height: 58.8 / 56,
          color: CustomColors.textColor,
        ),
        heading2: TextStyle(
          fontSize: 40.0,
          fontWeight: FontWeight.w700,
          height: 48 / 40,
          color: CustomColors.textColor,
        ),
        heading4: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w500,
          height: 32 / 24,
          color: CustomColors.textColor,
        ),
        pMedium: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          height: 21 / 14,
          color: CustomColors.textColor,
        ),
        buttonSmall: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          height: 16 / 14,
          color: CustomColors.textColor,
        ),
        buttonMedium: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
          height: 18 / 16,
          color: CustomColors.textColor,
        ),
      ),
    );
}

class OwnThemeFields {
  final TextStyle? heading1;
  final TextStyle? heading2;
  final TextStyle? heading4;
  final TextStyle? pMedium;
  final TextStyle? buttonSmall;
  final TextStyle? buttonMedium;

  const OwnThemeFields({
    required this.heading1,
    required this.heading2,
    required this.heading4,
    required this.pMedium,
    required this.buttonSmall,
    required this.buttonMedium,
  });

  factory OwnThemeFields.empty() {
    return const OwnThemeFields(
      heading1: TextStyle(),
      heading2: TextStyle(),
      heading4: TextStyle(),
      pMedium: TextStyle(),
      buttonSmall: TextStyle(),
      buttonMedium: TextStyle(),
    );
  }
}

extension ThemeDataExtensions on ThemeData {
  // ignore: prefer_final_fields
  static Map<InputDecorationTheme, OwnThemeFields> _own = {};

  void addOwn(OwnThemeFields own) {
    _own[inputDecorationTheme] = own;
  }

  static OwnThemeFields? empty;

  OwnThemeFields own() {
    var o = _own[inputDecorationTheme];

    return o!;
  }
}

OwnThemeFields ownTheme(BuildContext context) => Theme.of(context).own();
