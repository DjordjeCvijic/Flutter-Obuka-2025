import 'package:flutter/material.dart';
import 'package:my_first_app/providers/person_info_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_alert_dialog.dart';
import '../widgets/edit_data_box.dart';

class PersonInfoScreen extends StatelessWidget {
  const PersonInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PersonInfoProvider provider =
        Provider.of<PersonInfoProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Person Info Data"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => CustomAlertDialog(),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<PersonInfoProvider>(
              builder: (context, value, child) => Column(
                children: [
                  Text(provider.personModel.firstName),
                  Text(provider.personModel.lastName),
                ],
              ),
            ),
            Text(provider.personModel.email),
            Text(provider.personModel.phoneNumber),
            EditDataBox()
          ],
        ),
      ),
    );
  }
}
