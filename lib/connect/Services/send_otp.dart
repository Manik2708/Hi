import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hi/connect/httpErrorHandle.dart';
import 'package:hi/frontend/providers/otp_token.dart';
import 'package:hi/frontend/providers/user.dart';
import 'package:hi/frontend/widgets/dialogue_box.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../constants/global_variables.dart';
import '../models/user.dart';
class SendOtp{
  void sendOtp(BuildContext context)async{
    User user=context.read<UserProvider>().user;
    http.Response res=await http.post(Uri.parse('$uri/send-otp'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'token': user.token
      },
    );
  // ignore: use_build_context_synchronously
  httpErrorHandle(res: res, context: context, onSuccess: (){
    context.read<OtpToken>().setToken(jsonDecode(res.body)['otptoken']);
    showDialogBox(context: context, title: 'Success', content: 'OTP sent successfully', buttonText: null, onClick: null);
  });
  }
}