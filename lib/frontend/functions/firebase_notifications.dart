import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

Future<void> askForPermissions()async{
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

void receiveForegroundNotification(VoidCallback proceed){
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    if (message.notification != null) {
      proceed();
    }
  });
}