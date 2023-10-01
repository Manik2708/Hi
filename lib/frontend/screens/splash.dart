// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hi/frontend/functions/get_user_data_from_cache.dart';
import 'package:hi/frontend/functions/update_user_data_in_cache.dart';
import '../../connect/Services/create|_account.dart';
import '../../connect/models/user.dart';
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
    User user= await getUserDataFromCache(context);

    var duration=const Duration(seconds: 0);
    return  Timer(duration, () async{
      if(user.token.isEmpty){
        Navigator.pushNamed(context, '/get-started');
      }
      else{
        if(user.isEmailVerified==false){
          User updatedUser=await updateUserDataInCache(context);
          if(updatedUser.isEmailVerified==false){
            Navigator.pushNamed(context,'/email-verification');
          }
          else{
            Navigator.pushNamed(context,'/home-screen');
          }
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
