import 'package:flutter/material.dart';
import 'package:hi/frontend/functions/socket_on.dart';
import 'package:hi/frontend/providers/user.dart';
import 'package:provider/provider.dart';

import '../../connect/models/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    connectSocket();
  }
  void connectSocket()async{
    socketOn(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        actions: [
          
        ],
      ),
    );
  }
}
