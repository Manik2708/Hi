// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'send_firebase_registration_token.dart';

void lostToken(String fcm, BuildContext context)async{
  final SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  final firebaseToken=sharedPreferences.getString('registrationToken');
  if(firebaseToken==null){
    sendToken(fcm, context);
  }
  else{
    sendTokenApi(context, (){}, firebaseToken);
  }
}