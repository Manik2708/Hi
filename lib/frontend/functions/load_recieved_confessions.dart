// ignore_for_file: use_build_context_synchronously
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:hi/connect/httpErrorHandle.dart';
import 'package:hi/connect/models/recieved_confession.dart';
import 'package:hi/constants/global_variables.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../providers/user.dart';
Future<List<RecievedConfessionModel>> loadUnreadRecievedConfessions(String pageKey, BuildContext context)async{
  http.Response res=await http.get(Uri.parse('$uri/get-unread-recieved-confessions'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'token': context.read<UserProvider>().user.token,
      'confessionId': pageKey
    },
  );
  List<RecievedConfessionModel> list=[];
  httpErrorHandle(res: res, context: context, onSuccess: (){
    list=List<RecievedConfessionModel>.from(jsonDecode(res.body)['list'].map((x)=>RecievedConfessionModel.fromJson(x)));
  });
  return list;
}