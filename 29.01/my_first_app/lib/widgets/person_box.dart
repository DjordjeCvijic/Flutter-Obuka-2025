import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_first_app/models/gender_enum.dart';
import 'package:my_first_app/models/person_model.dart';
import 'package:my_first_app/providers/person_info_provider.dart';
import 'package:my_first_app/screens/person_info_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonBox extends StatelessWidget {
  final PersonModel person;
  const PersonBox({
    super.key,
    required this.person,
  });

  Future<void> writeData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    int? count = sharedPreferences.getInt("counter");
    if (count == null) {
      sharedPreferences.setInt('counter', 1);
    } else {
      count--;
      sharedPreferences.setInt('counter', count);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await writeData();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
              create: (context) => PersonInfoProvider(personModel: person),
              child: PersonInfoScreen(),
            ),
          ),
        );
      },
      child: Container(
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
      ),
    );
  }
}
