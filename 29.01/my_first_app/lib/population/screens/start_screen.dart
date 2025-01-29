import 'package:flutter/material.dart';
import 'package:my_first_app/population/providers/population_provider.dart';
import 'package:my_first_app/population/screens/population_screen.dart';
import 'package:provider/provider.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider(
                  create: (context) => PopulationProvider(),
                  child: PopulationScreen(),
                ),
              ),
            );
          },
          child: Text("Fetch and show data"),
        ),
      ),
    );
  }
}
