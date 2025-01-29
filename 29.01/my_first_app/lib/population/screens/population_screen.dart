import 'package:flutter/material.dart';
import 'package:my_first_app/population/providers/population_provider.dart';
import 'package:provider/provider.dart';

class PopulationScreen extends StatelessWidget {
  const PopulationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PopulationProvider provider =
        Provider.of<PopulationProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FutureBuilder(
          future: provider.fetchPopulation(),
          builder: (context, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? CircularProgressIndicator()
                  : ListView.builder(
                      itemCount: provider.populationList.length,
                      itemBuilder: (context, index) => Text(
                          "${provider.populationList.elementAt(index).year} -> ${provider.populationList.elementAt(index).populationNumber}"),
                    ),
        ),
      ),
    );
  }
}
