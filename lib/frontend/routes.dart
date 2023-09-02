import 'package:flutter/material.dart';
import 'package:hi/frontend/screens/create_account.dart';
import 'package:hi/frontend/screens/get_started.dart';
import 'package:hi/frontend/screens/home_screen.dart';
import 'package:hi/frontend/screens/login.dart';

import 'package:hi/frontend/screens/verify_email.dart';

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

