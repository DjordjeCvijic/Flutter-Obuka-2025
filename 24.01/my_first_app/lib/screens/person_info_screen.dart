import 'dart:developer';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/custom_alert_dialog.dart';
import '../widgets/custom_date_picker.dart';
import '../widgets/custom_input_field.dart';
import '../widgets/custom_modal_dialog.dart';
import '../widgets/password_input_field.dart';

class PersonInfoScreen extends StatelessWidget {
  final String firstAndLastName;

  const PersonInfoScreen({super.key, required this.firstAndLastName});

  void getData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    int? count = sharedPreferences.getInt("counter");
    log("Pristupili smo ekranu ovoliko puta: " + count.toString());
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(localization.name + " " + "Djordje"),
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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => CustomModalDialog(),
                  );
                },
                child: Text("BACK"),
              ),
              ElevatedButton(
                onPressed: () {
                  getData();
                },
                child: Text("Ispisi brojac"),
              ),
              CustomInputField(),
              CustomDatePicker(),
              PasswordInputField(),
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Divider(),
                          Text("This is Bottom sheet"),
                          CustomInputField(),
                        ],
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.arrow_upward),
              )
            ],
          ),
        ),
      ),
    );
  }
}
