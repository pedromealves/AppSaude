// ignore_for_file: prefer_const_constructors

import 'package:projeto/model/medicamento_model.dart';
import 'package:rxdart/subjects.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notifications {
  late BuildContext _context;

  Future<FlutterLocalNotificationsPlugin> initNotifies(BuildContext context,
      {bool initScheduled = false}) async {
    final _notifications = FlutterLocalNotificationsPlugin();
    // final onNotifications =
    //     BehaviorSubject<String?>(); // P/ escutar notificacoes

    final android = AndroidInitializationSettings('@mipmap/ic_launcher');
    final settings = InitializationSettings(android: android);

    await _notifications.initialize(settings,
        onSelectNotification: (payload) async {
      showDialog(
        context: _context,
        builder: (_) {
          return AlertDialog(
            title: Text("PayLoad"),
            content: Text("Payload : $payload"),
          );
        },
      );
    });

    return _notifications;
  }

  Future showNotification(String title, String description, int time, int id,
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        id.toInt(),
        title,
        description,
        tz.TZDateTime.now(tz.local).add(Duration(milliseconds: time)),
        const NotificationDetails(
            android: AndroidNotificationDetails(
          'id medicamentos',
          'medicamentos',
          channelDescription: 'notificacao para medicamentos',
          importance: Importance.max,
          priority: Priority.max,
          color: Colors.cyanAccent,
          enableVibration: true,
        )),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  Future removeNotify(int id,
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    flutterLocalNotificationsPlugin.cancel(id);
  }
}
