import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hi/frontend/widgets/dialogue_box.dart';
void httpErrorHandle({
  required http.Response res,
  required BuildContext context,
  required VoidCallback onSuccess
}){
  switch(res.statusCode){
    case 200: onSuccess();
    break;
    case 400: showDialogBox(context: context, title: 'Error!', content: jsonDecode(res.body)['msg'], buttonText: null, onClick: null);
    break;
    case 500: showDialogBox(context: context, title: 'Error!', content: jsonDecode(res.body)['msg'], buttonText: null, onClick: null);
    break;
    default: showDialogBox(context: context, title: 'Error!', content: jsonDecode(res.body)['msg'], buttonText: null, onClick: null);
  }
}