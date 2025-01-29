import 'package:flutter/material.dart';

class EditDataInputField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  const EditDataInputField({
    super.key,
    required this.hintText,
    required this.textController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: TextField(
        controller: textController,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}
