import 'package:ed_tech/main_navigation/settings/settings_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class EtSwitch extends StatefulWidget {
  final bool initValue;
  const EtSwitch({super.key, required this.initValue});

  @override
  State<EtSwitch> createState() => _EtSwitchState();
}

class _EtSwitchState extends State<EtSwitch> {
  late bool switchValue;

  @override
  void initState() {
    switchValue = widget.initValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final SettingsProvider provider =
        Provider.of<SettingsProvider>(context, listen: false);
    return CupertinoSwitch(
      value: switchValue,
      onChanged: (value) {
        provider.setNotificationFlag(notificationFlag: !switchValue);
        setState(() {
          switchValue = !switchValue;
        });
      },
    );
  }
}
