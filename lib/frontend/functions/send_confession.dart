// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:hi/connect/httpErrorHandle.dart';
import 'package:hi/connect/models/confession.dart';
import 'package:hi/connect/models/crush_model.dart';
import 'package:hi/constants/global_variables.dart';
import 'package:hi/frontend/providers/user.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
void sendConfession(CrushModel crush, BuildContext context, String Confession)async{
  ConfessionModel confession=ConfessionModel(
      id: '',
      SenderId: context.read<UserProvider>().user.id,
      SenderAnonymousId: context.read<UserProvider>().user.anonymousId,
      CrushId: crush.id,
      Confession: Confession,
      Time: DateTime.now().toString(),
      status: ''
  );
  http.Response res=await http.post(Uri.parse('$uri/send-confession'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'token': context.read<UserProvider>().user.token
    },
    body: confession.toJson(confession)
  );
  httpErrorHandle(res: res, context: context, onSuccess: (){});
}