import 'package:flutter/material.dart';
import 'package:hi/connect/models/confession.dart';
import 'package:hi/connect/models/user.dart';
import 'package:hi/connect/models/user_with_chats.dart';
import 'package:hi/frontend/boxes.dart';
import 'package:hi/frontend/providers/change_password.dart';
import 'package:hi/frontend/providers/confession_list_state.dart';
import 'package:hi/frontend/providers/date_of_birth.dart';
import 'package:hi/frontend/providers/otp_token.dart';
import 'package:hi/frontend/providers/search_user.dart';
import 'package:hi/frontend/providers/set_state_providers.dart';
import 'package:hi/frontend/providers/user.dart';
import 'package:hi/frontend/routes.dart';
import 'package:hi/frontend/screens/splash.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:hi/frontend/providers/show_password.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main()async{
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(UserWithChatsAdapter());
  Hive.registerAdapter(ConfessionModelAdapter());
  userDataBox=await Hive.openBox('UserData');
  sentConfessions=await Hive.openBox('SentConfessions');
  recievedConfessions=await Hive.openBox('RecievedConfessions');
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (context)=>ShowPassword()),
        ChangeNotifierProvider(create: (context)=>DateOfBirth()),
        ChangeNotifierProvider(create: (context)=>UserProvider()),
        ChangeNotifierProvider(create: (context)=>SetState()),
        ChangeNotifierProvider(create: (context)=>OtpToken()),
        ChangeNotifierProvider(create: (context)=>ChangePasswordProvider()),
        ChangeNotifierProvider(create: (context)=>SearchUserProvider()),
        ChangeNotifierProvider(create: (context)=>ConfessionList())
        ],
          child:const MaterialApp(home: MyApp(),))
      );
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context){

    return MaterialApp(
      onGenerateRoute: (settings)=>generateRoute(settings),
      theme: ThemeData(
       colorScheme: const ColorScheme.light(
         primary: Color.fromARGB(255, 119, 31, 152),
       ),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'AppFont'
      ),
        home: const Splash()
    );
  }
}




