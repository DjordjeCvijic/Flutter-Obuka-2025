import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({super.key});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  late DateTime dateTime;

  @override
  void initState() {
    super.initState();
    dateTime = DateTime.now();
  }

  String getDateTimeAsString(DateTime value) {
    return DateFormat('dd/MM/yyyy.').format(value);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDatePicker(
          context: context,
          firstDate: DateTime(1900),
          lastDate: DateTime(2200),
          initialDate: dateTime,
        ).then(
          (selectedDate) {
            if (selectedDate == null) {
              log("Niste izabrali datum");
            } else {
              log(selectedDate.toString());
              setState(() {
                dateTime = selectedDate;
              });
            }
          },
        );
      },
      child: Text("Picked date: ${getDateTimeAsString(dateTime)}"),
    );
  }
}
