import 'package:ed_tech/auth/login/login_provider.dart';
import 'package:ed_tech/auth/login/login_screen.dart';
import 'package:ed_tech/main_navigation/main_navigation.dart';
import 'package:ed_tech/auth/welcome/providers/et_placeholder_provider.dart';
import 'package:ed_tech/auth/welcome/splash_screen.dart';
import 'package:ed_tech/auth/welcome/welcome_screen_1.dart';
import 'package:ed_tech/main_navigation/main_navigation_provider.dart';
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
                  : (snapshot.data == NextScreenEnum.welcomeScreen
                      ? WelcomeScreen1()
                      : ChangeNotifierProvider(
                          create: (context) => MainNavigationProvider(),
                          child: MainNavigation(),
                        ))),
    );
  }
}
