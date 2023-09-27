import 'package:flutter/material.dart';
import 'package:hi/connect/models/crush_model.dart';
Widget searchedUserDetails(BuildContext context, Map<String, dynamic> json){
  final CrushModel crush=CrushModel.fromJson(json);
  return  Container(
        padding: const EdgeInsets.only(left: 8, top: 12),
        margin: const EdgeInsets.only(bottom: 15),
        height:65,
        width: 300,child: Row(
        children: [
          const Icon(Icons.account_circle_rounded, size: 70,),
          const SizedBox(width: 5,),
          Text(crush.username, style: const TextStyle(fontSize: 16),),
          TextButton(onPressed: (){
            Navigator.pushNamed(context, '/crush-screen', arguments: crush );
            }, child: const Text('Confess'))
        ],
      ),
    );
}

