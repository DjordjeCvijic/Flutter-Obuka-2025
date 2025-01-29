import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:my_first_app/population/models/population_model.dart';

class PopulationProvider extends ChangeNotifier {
  List<PopulationModel> populationList = [];

  Future<void> fetchPopulation() async {
    Uri url = Uri.parse(
        "https://datausa.io/api/data?drilldowns=Nation&measures=Population");

    Response response = await http.get(url);
    var jsonObject = jsonDecode(response.body);

    for (var element in (jsonObject["data"] as List)) {
      PopulationModel tmp = PopulationModel.fromJson(element);
      populationList.add(tmp);
    }

    await Future.delayed(Duration(seconds: 5));
  }
}
