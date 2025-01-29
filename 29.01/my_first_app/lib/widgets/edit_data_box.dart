import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../providers/person_info_provider.dart';
import 'edit_data_input_field.dart';

class EditDataBox extends StatelessWidget {
  const EditDataBox({super.key});

  @override
  Widget build(BuildContext context) {
    final PersonInfoProvider provider =
        Provider.of<PersonInfoProvider>(context, listen: false);
    return Column(
      children: [
        Divider(),
        Text("Edit Data"),
        EditDataInputField(
          hintText: "Edit fist name",
          textController: provider.firstNameTextController,
        ),
        Gap(8),
        EditDataInputField(
          hintText: "Edit last name",
          textController: provider.lastNameTextController,
        ),
        ElevatedButton(
          onPressed: () {
            provider.saveDate();
          },
          child: Text("Save data"),
        )
      ],
    );
  }
}
