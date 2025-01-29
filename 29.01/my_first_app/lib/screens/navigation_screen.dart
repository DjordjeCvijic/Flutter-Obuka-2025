import 'package:flutter/material.dart';
import 'package:my_first_app/screens/navigations_screen/first_screen.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text("Navigation screen"),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FirstScreen(),
                  settings: RouteSettings(name: FirstScreen.routName),
                ),
              );
            },
            child: Text("Navigate to first screen"),
          )
        ],
      ),
    );
  }
}
