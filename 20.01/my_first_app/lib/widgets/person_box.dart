import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_first_app/models/gender_enum.dart';
import 'package:my_first_app/models/person_model.dart';

class PersonBox extends StatelessWidget {
  final PersonModel person;
  const PersonBox({
    super.key,
    required this.person,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("${person.firstName} ${person.lastName}"),
              person.gender == GenderEnum.male
                  ? Icon(Icons.male)
                  : Icon(Icons.female)
            ],
          ),
          Row(
            children: [
              Icon(Icons.email),
              Gap(8),
              Text(person.email),
            ],
          ),
          Row(
            children: [
              Icon(Icons.phone),
              Gap(8),
              Text(person.phoneNumber),
            ],
          ),
          if (person.age < 50) Text("AGE:" + person.age.toString()),
        ],
      ),
    );
  }
}
