import 'package:flutter/material.dart';

Widget searchedUserDetails(String username){
  return  Container(
        padding: const EdgeInsets.only(left: 8, top: 12),
        margin: const EdgeInsets.only(bottom: 15),
        height:65,
        width: 300,child: Row(
        children: [
          const Icon(Icons.account_circle_rounded, size: 70,),
          const SizedBox(width: 5,),
          Text(username, style: const TextStyle(fontSize: 16),),
        ],
      ),
    );
}

