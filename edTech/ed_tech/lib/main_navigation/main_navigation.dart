import 'package:ed_tech/login/login_provider.dart';
import 'package:ed_tech/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/global_const.dart';

class MainNavigation extends StatelessWidget {
  const MainNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Text("App navigation"),
          ElevatedButton(
            onPressed: () async {
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              prefs.setBool(SharedPreferencesKeys.loggedIn, false);

              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => ChangeNotifierProvider(
                    create: (context) => LoginProvider(),
                    child: LoginScreen(),
                  ),
                ),
              );
            },
            child: Text("Log out"),
          )
        ],
      )),
    );
  }
}
