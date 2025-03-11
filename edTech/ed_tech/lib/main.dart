import 'package:ed_tech/auth/welcome/providers/et_placeholder_provider.dart';
import 'package:ed_tech/helpers/custom_themes.dart';
import 'package:ed_tech/main_provider.dart';
import 'package:ed_tech/services/firebase_notification_service.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth/welcome/et_placeholder.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseNotificationService.initialize().then((value) {
    FirebaseNotificationService.getFcmToken();
    FirebaseNotificationService.subscribeToTopic("general");
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: CustomThemes.lightTheme,
        home: ChangeNotifierProvider(
          create: (context) => EtPlaceholderProvider(),
          child: ETPlaceholder(),
        ),
      ),
    );
  }
}
