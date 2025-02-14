import 'package:flutter/cupertino.dart';

class EtSwitch extends StatefulWidget {
  const EtSwitch({super.key});

  @override
  State<EtSwitch> createState() => _EtSwitchState();
}

class _EtSwitchState extends State<EtSwitch> {
  bool switchValue = true;
  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: switchValue,
      onChanged: (value) {
        setState(() {
          switchValue = !switchValue;
        });
      },
    );
  }
}
