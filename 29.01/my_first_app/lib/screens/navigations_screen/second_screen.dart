import 'package:flutter/material.dart';
import 'package:my_first_app/screens/navigations_screen/third_screen.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text("Second screen"),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ThirdScreen(),
                ),
              );
            },
            child: Text("Navigate to third screen"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Pop to first screen"),
          )
        ],
      ),
    );
  }
}
