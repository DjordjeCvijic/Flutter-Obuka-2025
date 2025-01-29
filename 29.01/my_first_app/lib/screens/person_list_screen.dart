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
              Text("Ovo je lista osoba:"),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: DummyData.personList.length,
                itemBuilder: (context, index) => PersonBox(
                  person: DummyData.personList[index],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
