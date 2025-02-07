import 'package:ed_tech/login/login_provider.dart';
import 'package:ed_tech/login/login_screen.dart';
import 'package:ed_tech/welcome/providers/et_placeholder_provider.dart';
import 'package:ed_tech/welcome/splash_screen.dart';
import 'package:ed_tech/welcome/welcome_screen_1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ETPlaceholder extends StatelessWidget {
  const ETPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    final EtPlaceholderProvider provider =
        Provider.of<EtPlaceholderProvider>(context, listen: false);
    return FutureBuilder(
      future: provider.nextScreen(),
      builder: (context, snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? SplashScreen()
              : (snapshot.data == NextScreenEnum.loginScreen
                  ? ChangeNotifierProvider(
                      create: (context) => LoginProvider(),
                      child: LoginScreen(),
                    )
                  : WelcomeScreen1()),
    );
  }
}
