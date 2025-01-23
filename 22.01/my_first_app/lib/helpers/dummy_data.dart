import 'package:my_first_app/models/gender_enum.dart';
import 'package:my_first_app/models/person_model.dart';

class DummyData {
  static List<PersonModel> personList = [
    PersonModel(
      firstName: "Marko",
      lastName: "Markovic",
      age: 20,
      email: "markomarkovic@email.com",
      phoneNumber: "065065065",
      gender: GenderEnum.male,
    ),
    PersonModel(
      firstName: "Jovana",
      lastName: "Jovanovic",
      age: 85,
      email: "joca@email.com",
      phoneNumber: "065065065",
      gender: GenderEnum.female,
    ),
    PersonModel(
      firstName: "Mirko",
      lastName: "Markovic",
      age: 25,
      email: "mirkomarkovic@email.com",
      phoneNumber: "898989854",
      gender: GenderEnum.male,
    ),
    PersonModel(
      firstName: "Jovana",
      lastName: "Jovanovic",
      age: 85,
      email: "joca@email.com",
      phoneNumber: "065065065",
      gender: GenderEnum.female,
    ),
    PersonModel(
      firstName: "Jovana",
      lastName: "Jovanovic",
      age: 85,
      email: "joca@email.com",
      phoneNumber: "065065065",
      gender: GenderEnum.female,
    ),
    PersonModel(
      firstName: "Jovana",
      lastName: "Jovanovic",
      age: 85,
      email: "joca@email.com",
      phoneNumber: "065065065",
      gender: GenderEnum.female,
    )
  ];
}
