import 'package:my_first_app/models/gender_enum.dart';

class PersonModel {
  String firstName;
  String lastName;
  String email;
  int age;
  String phoneNumber;
  GenderEnum gender;

  PersonModel({
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.email,
    required this.phoneNumber,
    required this.gender,
  });
}
