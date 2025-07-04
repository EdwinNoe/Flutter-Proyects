import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationService {
  static int _notificationCounter = 0;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();


  // Pedir permiso en Android
  Future<void> init() async {
    if (await Permission.notification.isDenied ||
        await Permission.notification.isPermanentlyDenied) {
      await Permission.notification.request();
    }

    const androidInitialize = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const iOSInitialize = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    const initializationSettings = InitializationSettings(
      android: androidInitialize,
      iOS: iOSInitialize,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showNotification({
    required String title,
    required String body,
    String? subtitle,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'channelId',
      'Local notifications',
      channelDescription: 'This is a channel for notifications',
      importance: Importance.max,
      priority: Priority.high,
    );

    final iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      subtitle: subtitle,
      threadIdentifier: 'thread_id',
    );

    await flutterLocalNotificationsPlugin.show(
      _notificationCounter++,
      title,
      body,
      NotificationDetails(
        android: androidDetails,
        iOS: iosDetails,
      ),
    );
  }
}
