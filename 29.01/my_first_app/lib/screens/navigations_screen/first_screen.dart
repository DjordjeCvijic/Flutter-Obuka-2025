import 'package:flutter/material.dart';
import 'package:my_first_app/screens/navigations_screen/second_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});
  static String routName = "First screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text("First screen"),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SecondScreen(),
                ),
              );
            },
            child: Text("Navigate to second screen"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => SecondScreen(),
                ),
              );
            },
            child: Text("Navigate to second screen and remove first"),
          )
        ],
      ),
    );
  }
}
