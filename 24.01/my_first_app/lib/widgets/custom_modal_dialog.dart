import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomModalDialog extends StatelessWidget {
  const CustomModalDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Naslov dialoga",
              style: TextStyle(fontSize: 25),
            ),
            Text("Da li zelite napustiti ekran"),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: Text("DA"),
                ),
                Gap(8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("NE"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
