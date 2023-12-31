import 'package:flutter/material.dart';
import 'package:hi/connect/models/crush_model.dart';
import 'package:hi/frontend/screens/change_email.dart';
import 'package:hi/frontend/screens/change_password.dart';
import 'package:hi/frontend/screens/create_account.dart';
import 'package:hi/frontend/screens/retrieve_chats.dart';
import 'package:hi/frontend/screens/send_confession.dart';
import 'package:hi/frontend/screens/get_started.dart';
import 'package:hi/frontend/screens/home_screen.dart';
import 'package:hi/frontend/screens/login.dart';
import 'package:hi/frontend/screens/main_screen.dart';

import 'package:hi/frontend/screens/verify_email.dart';
import 'package:hi/frontend/screens/verify_otp_change_password.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings){
switch(routeSettings.name) {
  case LoginScreen.routeName:
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_)=>const LoginScreen(),
    );
  case CreateAccount.routeName:
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_)=>const CreateAccount(),
    );
  case '/get-started':
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_)=>const GetStarted(),
    );
  case '/home-screen':
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_)=>const HomeScreen(),
    );
  case '/email-verification':
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_)=>const VerifyEmail(),
    );
  case '/change-password':
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_)=>const ChangePassword(),
    );
  case '/verification-for-changing-password':
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_)=>const VerifyChangePassword(),
    );
  case '/change-email':
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_)=>const ChangeEmail(),
    );
  case '/main-screen':
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_)=>const MainScreen(),
    );
  case '/crush-screen':
    var crush=routeSettings.arguments as CrushModel;
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_)=>CrushScreen(crush: crush,),
    );
  case '/retrieve-chats':
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_)=>const RetrieveChats(),
    );
  default:
    return MaterialPageRoute(
        settings: routeSettings,
        builder: (_)=>const ErrorScreen(),
    );
  }
}
class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('404!'),
    );
  }
}

