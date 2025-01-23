import 'dart:developer';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonInfoScreen extends StatelessWidget {
  // final String firstName;
  // final String lastName;
  final String firstAndLastName;

  const PersonInfoScreen(
      {super.key,
      // required this.firstName,
      // required this.lastName,
      required this.firstAndLastName});

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
        // backgroundColor: Colors.grey,
        title: Text(localization.name + " " + "Djordje"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("BACK"),
              ),
              ElevatedButton(
                onPressed: () {
                  getData();
                },
                child: Text("Ispisi brojac"),
              ),

              Text(
                firstAndLastName,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                firstAndLastName,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              // Image.asset(
              //     "https://static.javatpoint.com/tutorial/flutter/images/flutter-creating-android-platform-specific-code3.png")
            ],
          ),
        ),
      ),
    );
  }
}
