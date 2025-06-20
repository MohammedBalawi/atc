import 'package:act_hub_mobile/config/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FbNotifications {
  static AndroidNotificationChannel? channel;
  static FlutterLocalNotificationsPlugin? localNotificationsPlugin;

  static Future<void> initNotifications() async {
    await Firebase.initializeApp();

    if (!kIsWeb) {
      channel = const AndroidNotificationChannel(
        Constants.notificationChannel,
        Constants.notificationChannelName,
        description: Constants.notificationChannelDescription,
        importance: Importance.high,
        enableLights: true,
        enableVibration: true,
        ledColor: Colors.orange,
        showBadge: true,
        playSound: true,
      );
    }

    localNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await localNotificationsPlugin
        ?.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(
          channel!,
        );

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  static Future<void> deInitializeNotifications() async {
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: false,
      badge: false,
      sound: false,
    );

    if (!kIsWeb) {
      await localNotificationsPlugin?.cancelAll();
    }

    channel = null;
    localNotificationsPlugin = null;
  }

  Future<void> requestNotificationPermissions() async {
    NotificationSettings notificationSettings =
        await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      carPlay: false,
      announcement: false,
      provisional: false,
      criticalAlert: false,
    );

    if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.authorized) {
      print('GRANT PERMISSION');
    } else if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.denied) {
      print('Permission Denied');
    }
  }

  Future<void> initializeForegroundNotificationForAndroid() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Message Received: ${message.messageId}');
      RemoteNotification? notification = message.notification;
      AndroidNotification? androidNotification = notification?.android;
      if (notification != null &&
          androidNotification != null &&
          localNotificationsPlugin != null) {
        localNotificationsPlugin!.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel!.id,
              channel!.name,
              channelDescription: channel!.description,
              icon: Constants.notificationIconName,
              playSound: true,
            ),
          ),
        );
      }
    });
  }

  void manageNotificationAction() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _controlNotificationNavigation(message.data);
    });
  }

  void _controlNotificationNavigation(Map<String, dynamic> data) {
    print('Data: $data');
    if (data['page'] != null) {
      switch (data['page']) {
        case 'products':
          var productId = data['id'];
          print('Product Id: $productId');
          break;
        case 'settings':
          print('Navigate to settings');
          break;
        case 'profile':
          print('Navigate to Profile');
          break;
      }
    }
  }
}
