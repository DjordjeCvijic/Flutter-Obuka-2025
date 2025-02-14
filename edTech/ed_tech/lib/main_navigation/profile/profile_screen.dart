import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../auth/login/login_provider.dart';
import '../../auth/login/login_screen.dart';
import '../../services/user_service.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("Profile screen"),
          ElevatedButton(
            onPressed: () {
              UserService.setUserLoggedIn(false);
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
      ),
    );
  }
}
