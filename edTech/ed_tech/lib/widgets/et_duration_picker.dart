import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';

class EtDurationPicker extends StatefulWidget {
  const EtDurationPicker({super.key});

  @override
  State<EtDurationPicker> createState() => _EtDurationPickerState();
}

class _EtDurationPickerState extends State<EtDurationPicker> {
  Duration _duration = Duration(hours: 0, minutes: 0);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DurationPicker(
          duration: _duration,
          onChange: (val) {
            setState(() => _duration = val);
          },
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(_duration);
          },
          child: Text("Save"),
        ),
      ],
    );
  }
}
