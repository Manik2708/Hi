import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
    final User user=context.read<UserProvider>().user;
    return Scaffold(
      body:  Center(child: Text(user.token),),
    );
  }
}
