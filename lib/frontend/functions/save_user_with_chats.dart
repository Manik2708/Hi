// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:hi/connect/httpErrorHandle.dart';
import 'package:hi/connect/models/user_with_chats.dart';
import 'package:hi/frontend/boxes.dart';
import 'package:http/http.dart' as http;
import 'package:hi/constants/global_variables.dart';
import 'package:provider/provider.dart';
import '../providers/user.dart';
import '../widgets/dialogue_box.dart';
Future<void> saveUserWithChats(BuildContext context)async{
  try{
    http.Response res=await http.get(Uri.parse('$uri/get-user-data'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'token': context.read<UserProvider>().user.token
      },
    );
    httpErrorHandle(res: res, context: context, onSuccess: ()async{
      debugPrint(res.body);
      UserWithChats userWithChats=UserWithChats.fromJson(jsonDecode(res.body));
      userDataBox.put(BoxNames.userData, userWithChats);
      debugPrint(userDataBox.get(BoxNames.userData)!.username);
      sentConfessions.put(BoxNames.sentConfessionsList, userWithChats.sentConfessions!);
      recievedConfessions.put(BoxNames.recievedConfessionsList, userWithChats.recievedConfessions!);
    });
  }
  catch(e){
    return showDialogBox(context: context, title: 'Error', content: e.toString(), buttonText: null, onClick: null);
  }
}