import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

import '../helpers/global_const.dart';

class FirebaseNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    if (Platform.isAndroid) {
      await Firebase.initializeApp(
        options: FirebaseOptions(
          apiKey: FirebaseConst.apiKey,
          appId: FirebaseConst.appId,
          messagingSenderId: FirebaseConst.messagingSenderId,
          projectId: FirebaseConst.projectId,
        ),
      );
    } else {
      await Firebase.initializeApp();
    }

    var androidNotificationChannel = AndroidNotificationChannel(
      "ed_tech",
      "ed_tech_channels",
      importance: Importance.max,
    );

    await _notificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .createNotificationChannel(androidNotificationChannel);

    FirebaseMessaging.onMessage.listen(
      (message) {
        log("Poruka stigla");
        displayNotification(message);
      },
    );

    Permission.notification.isDenied.then(
      (value) {
        if (value) {
          Permission.notification.request();
        }
      },
    );
    const android = AndroidInitializationSettings("@drawable/notification_ic");
    const iOS = DarwinInitializationSettings();
    const settings = InitializationSettings(android: android, iOS: iOS);

    _notificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: (details) {
        //tap handler for foreground state
        log("tap handler for foreground state ");
        log("Message: " + details.payload.toString());
      },
    );

    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        //tap handler for terminate state
        log("tap handler for terminate state ");
      },
    );

    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        //tap handler for background state
        log("tap handler for background state ");
        log("Message: " + message.data.toString());
      },
    );
  }

  static Future<void> getFcmToken() async {
    await Firebase.initializeApp();
    String? fcmToken = await FirebaseMessaging.instance.getToken();

    log("FCM TOKEN :${fcmToken ?? "Tokena nema"}");
  }

  static void subscribeToTopic(String topic) {
    FirebaseMessaging.instance.subscribeToTopic(topic);
  }

  static NotificationDetails getNotificationDetails() {
    return NotificationDetails(
      android: AndroidNotificationDetails(
        "ed_tech",
        "ed_tech_channels",
        importance: Importance.max,
        priority: Priority.high,
        icon: "@drawable/notification_ic",
      ),
      iOS: DarwinNotificationDetails(
        presentAlert: true,
        presentSound: true,
      ),
    );
  }

  static void displayNotification(RemoteMessage message) {
    _notificationsPlugin.show(
      DateTime.now().millisecond,
      message.notification!.title,
      message.notification!.body,
      getNotificationDetails(),
      payload: jsonEncode(message.data),
    );
  }
}
