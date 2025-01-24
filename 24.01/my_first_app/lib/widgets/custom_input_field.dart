import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              obscureText: true,
              controller: textController,
              decoration: InputDecoration(
                hintText: "Unesite email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
              onChanged: (value) {
                log("Broj karaktera: " + value.length.toString());
              },
            ),
          ),
          Gap(8),
          ElevatedButton(
            onPressed: () {
              log(textController.text);
            },
            child: Text("Ispisi"),
          ),
        ],
      ),
    );
  }
}
