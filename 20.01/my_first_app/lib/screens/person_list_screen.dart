import 'package:flutter/material.dart';
import 'package:my_first_app/helpers/dummy_data.dart';

import '../widgets/person_box.dart';

class PersonListScreen extends StatelessWidget {
  const PersonListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        toolbarHeight: 20,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              PersonBox(
                person: DummyData.personList[0],
              ),
              PersonBox(
                person: DummyData.personList[1],
              ),
              PersonBox(
                person: DummyData.personList[2],
              ),
              PersonBox(
                person: DummyData.personList[3],
              ),
              PersonBox(
                person: DummyData.personList[4],
              ),
              PersonBox(
                person: DummyData.personList[5],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
