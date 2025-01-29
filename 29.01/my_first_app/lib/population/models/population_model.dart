class PopulationModel {
  final String year;
  final int populationNumber;

  PopulationModel({
    required this.year,
    required this.populationNumber,
  });

  static PopulationModel fromJson(jsonModel) {
    return PopulationModel(
      year: jsonModel["Year"],
      populationNumber: jsonModel["Population"],
    );
  }
}
