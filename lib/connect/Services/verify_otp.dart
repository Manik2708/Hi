// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hi/connect/httpErrorHandle.dart';
import 'package:hi/frontend/functions/update_user_data_in_cache.dart';
import 'package:hi/frontend/providers/otp_token.dart';
import 'package:hi/frontend/providers/user.dart';
import 'package:hi/frontend/widgets/dialogue_box.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../constants/global_variables.dart';
import '../models/user.dart';
class VerifyOtp{
  void verifyOtp(BuildContext context, String code)async{
   try{
     User user=context.read<UserProvider>().user;
     http.Response res=await http.post(Uri.parse('$uri/verify-email'),
         headers: <String, String>{
           'Content-Type': 'application/json; charset=UTF-8',
           'token': user.token
         },
         body: jsonEncode({'otptoken': context.read<OtpToken>().otpToken, 'otp': code})
     );
     httpErrorHandle(res: res, context: context, onSuccess: ()async{
       showDialogBox(context: context, title: 'Success', content: 'Email Verified Successfully', buttonText: null, onClick: null);
       await updateUserDataInCache(context);
       Navigator.pushNamed(context, '/home-screen');
     });
   }catch(e){
     return showDialogBox(context: context, title: 'Error', content: e.toString(), buttonText: null, onClick: null);
   }
  }
}