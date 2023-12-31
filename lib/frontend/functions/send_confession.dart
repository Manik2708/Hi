// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hi/connect/httpErrorHandle.dart';
import 'package:hi/connect/models/confession.dart';
import 'package:hi/connect/models/crush_model.dart';
import 'package:hi/constants/global_variables.dart';
import 'package:hi/frontend/boxes.dart';
import 'package:hi/frontend/providers/user.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
void sendConfession(CrushModel crush, BuildContext context, String confessionText)async{
  ConfessionModel confession=ConfessionModel(
      id: '',
      senderId: context.read<UserProvider>().user.id,
      senderAnonymousId: context.read<UserProvider>().user.anonymousId,
      crushId: crush.id,
      confession: confessionText,
      time: DateTime.now().toString(),
      status: '',
      crushName: crush.username
  );
  http.Response res=await http.post(Uri.parse('$uri/send-confession'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'token': context.read<UserProvider>().user.token
    },
    body: confession.toJson(confession)
  );
  httpErrorHandle(res: res, context: context, onSuccess: (){
    debugPrint(res.body);
    saveSentConfession(ConfessionModel.fromJson(jsonDecode(res.body)));
  });
}