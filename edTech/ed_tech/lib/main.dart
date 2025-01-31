import 'package:ed_tech/helpers/custom_themes.dart';
import 'package:flutter/material.dart';

import 'welcome/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: CustomThemes.lightTheme,
      home: SplashScreen(),
    );
  }
}
