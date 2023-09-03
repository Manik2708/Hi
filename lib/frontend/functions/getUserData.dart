// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../constants/global_variables.dart';
import '../providers/user.dart';
import '../widgets/dialogue_box.dart';
import '../../connect/httpErrorHandle.dart';
import '../../connect/models/user.dart';

Future<User> ifNotHacked(BuildContext context) async {
  User user=User(name: '', email: '', anonymousId: '', username: '', password: '', dob: '',  isEmailVerified: false, token: '', id: '');
  try {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    String? token=prefs.getString('token');
    if(token==null){
      prefs.setString('token', '');
      token='';
    }
    if(token.isEmpty){
      return user;
    }
    http.Response res=await http.get(Uri.parse('$uri/get-user-data'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'token': token
      },
    );
    httpErrorHandle(res: res, context: context, onSuccess: (){ Provider.of<UserProvider>(context, listen: false).setUser(jsonDecode(res.body));});

    user=context.read<UserProvider>().user;

  }catch(e){
    showDialogBox(context: context, title: 'Error', content: e.toString(), buttonText: null, onClick: null);
    return user;
  }
  return user;
}