import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hi/frontend/functions/save_user_with_chats.dart';

class RetrieveChats extends StatefulWidget {
  const RetrieveChats({super.key});

  @override
  State<RetrieveChats> createState() => _RetrieveChatsState();
}

class _RetrieveChatsState extends State<RetrieveChats> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    retrieveData();
  }
  retrieveData()async{
    await saveUserWithChats(context);
    var duration=const Duration(seconds: 0);
    return Timer(duration, () {
         Navigator.pushNamed(context, '/home-screen');
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Loading Chats'),),
    );
  }
}
