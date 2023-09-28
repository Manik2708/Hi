// ignore_for_file: use_build_context_synchronously
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:hi/connect/httpErrorHandle.dart';
import 'package:hi/constants/global_variables.dart';
import 'package:hi/frontend/providers/user.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
void sendToken(String firebaseToken, BuildContext context)async{
  try {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance();
    final registrationToken = sharedPreferences.getString('registrationToken');
    if (registrationToken == null) {
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

      httpErrorHandle(res: res, context: context, onSuccess: () async {
        await sharedPreferences.setString('registrationToken', jsonDecode(res.body)['token']);
      });
    }
  }catch(e){
    debugPrint(e.toString());
  }
}