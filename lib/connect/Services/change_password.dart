// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hi/connect/httpErrorHandle.dart';
import 'package:hi/constants/global_variables.dart';
import 'package:hi/frontend/providers/change_password.dart';
import 'package:hi/frontend/widgets/dialogue_box.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
class ChangePasswordServices{
  void sendOtp(BuildContext context, String email)async{
    try{
      http.Response res=await http.post(Uri.parse('$uri/send-otp-change-password'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: json.encode({
            'identify': email
          })
      );
      httpErrorHandle(res: res, context: context, onSuccess: (){
        context.read<ChangePasswordProvider>().set(jsonDecode(res.body)['otptoken'], jsonDecode(res.body)['id'], jsonDecode(res.body)['email']);
        if(!context.read<ChangePasswordProvider>().onVerificationScreen){
          Navigator.pushNamed(context, '/verification-for-changing-password');
        }
      });
    }catch(e){
      showDialogBox(context: context, title: 'Error', content: e.toString(), buttonText: null, onClick: null);
    }
  }
  void verifyOtp(BuildContext context, String code, String password)async{
   try{
     http.Response res=await http.post(Uri.parse('$uri/change-password'),
         headers: <String, String>{
           'Content-Type': 'application/json; charset=UTF-8',
         },
         body: json.encode({
           'otptoken': context.read<ChangePasswordProvider>().otptoken,
           'id': context.read<ChangePasswordProvider>().id,
           'password': password,
           'otp': code
         })
     );
     httpErrorHandle(res: res, context: context, onSuccess: (){
       showDialogBox(context: context, title: 'Password Changed', content: 'Password Changed Successfully', buttonText: null, onClick: null);
       Navigator.pushNamed(context, '/login');
     });
   }catch(e){
     showDialogBox(context: context, title: 'Error', content: e.toString(), buttonText: null, onClick: null);
   }
  }
}