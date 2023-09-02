import 'package:flutter/material.dart';

Future<void>showDialogBox({required BuildContext context, required String title, required String content, required String? buttonText, required VoidCallback? onClick} ){
  return showDialog(context: context, builder: (BuildContext context){
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(onPressed: onClick ?? (){Navigator.pop(context);}, child: buttonText==null?const Text('Ok'):Text(buttonText))
      ],
    );
  });
}
