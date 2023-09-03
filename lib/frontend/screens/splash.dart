import 'dart:async';
import 'package:flutter/material.dart';
import '../../connect/Services/create|_account.dart';
import '../../connect/models/user.dart';
import 'package:hi/frontend/functions/getUserData.dart';
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  CreateAccountServices createAccountServices=CreateAccountServices();
  @override
  void initState() {
    super.initState();
    getData();
  }
  getData()async{
    User user= await ifNotHacked(context);
    var duration=const Duration(seconds: 0);
    return  Timer(duration, () {
      if(user.token.isEmpty){
        Navigator.pushNamed(context, '/get-started');
      }
      else{
        if(user.isEmailVerified==false){
          Navigator.pushNamed(context,'/email-verification');
        }
        else{
          Navigator.pushNamed(context,'/home-screen');
        }
      }
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Loading Data'),
      ),
    );
  }
}
