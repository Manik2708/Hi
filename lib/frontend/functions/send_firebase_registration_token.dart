// ignore_for_file: use_build_context_synchronously
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:hi/connect/httpErrorHandle.dart';
import 'package:hi/constants/global_variables.dart';
import 'package:hi/frontend/providers/user.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void sendTokenApi(BuildContext context, onSuccess, String firebaseToken)async{
  http.Response res = await http.post(Uri.parse('$uri/firebase-token'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'token': context
            .read<UserProvider>()
            .user
            .token
            .toString()
      },
      body: json.encode({'token': firebaseToken})
  );

  httpErrorHandle(res: res, context: context, onSuccess: onSuccess);
}
void sendToken(String firebaseToken, BuildContext context)async{
  try {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance();
    final registrationToken = sharedPreferences.getString('registrationToken');
    if (registrationToken == null) {
      sendTokenApi(context, (){
        sharedPreferences.setString('registrationToken', firebaseToken);
      }, firebaseToken);
    }
  }catch(e){
    debugPrint(e.toString());
  }
}

