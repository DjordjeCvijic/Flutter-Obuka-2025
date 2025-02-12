import 'package:ed_tech/helpers/custom_themes.dart';
import 'package:ed_tech/auth/welcome/providers/et_placeholder_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth/welcome/et_placeholder.dart';

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
      home: ChangeNotifierProvider(
        create: (context) => EtPlaceholderProvider(),
        child: ETPlaceholder(),
      ),
    );
  }
}
