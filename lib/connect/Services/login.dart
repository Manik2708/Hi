// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hi/connect/httpErrorHandle.dart';
import 'package:hi/constants/global_variables.dart';
import 'package:hi/frontend/widgets/dialogue_box.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../frontend/providers/user.dart';
class Login{
  void login(BuildContext context,String email, String password)async{
   try{
     http.Response res=await http.post(Uri.parse('$uri/login'),
         headers: <String, String>{
           'Content-Type': 'application/json; charset=UTF-8',
         },
         body: jsonEncode({
           'identify': email,
           'password': password
         })
     );
     httpErrorHandle(res: res, context: context, onSuccess: ()async{
       SharedPreferences prefs=await SharedPreferences.getInstance();
       await prefs.setString('token', jsonDecode(res.body)['token']);
       Provider.of<UserProvider>(context, listen: false).setUser(jsonDecode(res.body));
       showDialogBox(context: context, title: 'Success', content: 'Login Successful', buttonText: null, onClick: null);
       if(context.read<UserProvider>().user.isEmailVerified){
         Navigator.pushNamed(context, '/home-screen');
       }
       else{
         Navigator.pushNamed(context, '/email-verification');
       }
     });
   }catch(e){
     return showDialogBox(context: context, title: 'Error', content: e.toString(), buttonText: null, onClick: null);
   }
  }
}