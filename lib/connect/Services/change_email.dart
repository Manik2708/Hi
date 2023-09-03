// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hi/connect/httpErrorHandle.dart';
import 'package:hi/frontend/functions/getUserData.dart';
import 'package:hi/frontend/providers/user.dart';
import 'package:hi/frontend/widgets/dialogue_box.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../constants/global_variables.dart';
import '../models/user.dart';
class ChangeEmailServices{
  void changeEmail(BuildContext context, String password, String email)async{
try {
  User user = context.read<UserProvider>().user;
  http.Response res = await http.post(Uri.parse('$uri/change-email'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'token': user.token
      },
      body: json.encode({
        'password': password,
        'email': email
      })
  );
  httpErrorHandle(res: res, context: context, onSuccess: () async {
    await ifNotHacked(context);
    showDialogBox(context: context,
        title: 'Success',
        content: 'Email Changed Successfully',
        buttonText: null,
        onClick: null);
    Navigator.pushNamed(context, '/email-verification');
  });
}
    catch(e){
      showDialogBox(context: context, title: 'Error', content: e.toString(), buttonText: null, onClick: null);
    }
  }
}