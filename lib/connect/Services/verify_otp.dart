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
class VerifyOtp{
  void verifyOtp(BuildContext context, String code)async{
    User user=context.read<UserProvider>().user;
    http.Response res=await http.post(Uri.parse('$uri/verify-email'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'token': user.token
      },
      body: jsonEncode({'otptoken': context.read<OtpToken>().otpToken, 'otp': code})
    );
    // ignore: use_build_context_synchronously
    httpErrorHandle(res: res, context: context, onSuccess: (){
      showDialogBox(context: context, title: 'Success', content: 'Email Verified Successfully', buttonText: null, onClick: null);
      Navigator.pushNamed(context, '/home-screen');
    });
  }
}