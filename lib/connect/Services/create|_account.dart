// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hi/connect/models/user_with_chats.dart';
import 'package:hi/constants/global_variables.dart';
import 'package:hi/frontend/boxes.dart';
import 'package:hi/frontend/providers/user.dart';
import 'package:hi/frontend/widgets/dialogue_box.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:hi/connect/httpErrorHandle.dart';
import 'package:hi/connect/models/user.dart';
import 'package:http/http.dart' as http;

class CreateAccountServices{
void createAccount({
  required BuildContext context,
  required String name,
  required String email,
  required String anonymousId,
  required String username,
  required String password,
  required String dob,
  required bool isEmailVerified,
  required String token,
  required String id,})
async{
  try{
    User user=User(name: name, email: email, anonymousId: anonymousId, username: username, password: password, dob: dob, isEmailVerified: isEmailVerified, token: token, id: id);
    http.Response res =await http.post(Uri.parse('$uri/create-account-without-verification'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: user.toJson(user)
    );

    httpErrorHandle(res: res,  context: context, onSuccess:  () async{

      SharedPreferences prefs=await SharedPreferences.getInstance();
       showDialogBox(context: context, title: 'Success', content: 'Account Created Successfully, Now verify your Phone Number and Email Address', buttonText: 'Verify', onClick: (){
         Navigator.pushNamed(context, '/email-verification');
       });
      await prefs.setString('token', jsonDecode(res.body)['token']);
      userDataBox.put('userdata', UserWithChats.fromJson(jsonDecode(res.body)));
       Provider.of<UserProvider>(context, listen: false).setUser(jsonDecode(res.body));
    });
  }catch(e){
    return showDialogBox(context: context, title: 'Error', content: e.toString(), buttonText: null, onClick: null);
  }
}
}
