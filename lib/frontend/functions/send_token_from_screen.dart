// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hi/frontend/functions/lost_token_function.dart';
import 'package:hi/frontend/functions/send_firebase_registration_token.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants/global_variables.dart';
import 'package:hi/frontend/functions/socket_on.dart';
void getToken(BuildContext context)async{
  final fcmToken = await FirebaseMessaging.instance.getToken();
  sendToken(fcmToken!, context);
  FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
    sendTokenApi(context, ()async{
      final SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
      sharedPreferences.setString('registrationToken', fcmToken);
    }, fcmToken);
  }).onError((err) {});
  socket!.on(EventNames.tokenLost, (data)async{
    lostToken(fcmToken, context);
  });
}