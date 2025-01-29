import 'package:flutter/material.dart';

import 'first_screen.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text("Third screen"),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: Text("Pop to first screen 1"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).popUntil(
                ModalRoute.withName(FirstScreen.routName),
              );
            },
            child: Text("Pop to first screen 2"),
          )
        ],
      ),
    );
  }
}
