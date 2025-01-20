import 'dart:developer';

class Person {
  String firstName;
  String lastName;
  int age;
  String phoneNumber;

  Person(
    this.phoneNumber, {
    required this.firstName,
    required this.lastName,
    this.age = 52,
  });

  void printPersonData() {
    log("My name is: $firstName $lastName");
    log("My name is: " + firstName + " " + lastName);
  }

  void printYearOfBirth(int currentYear, {required String text}) {
    log("Year of birth: " + (currentYear - age).toString());
  }
}
