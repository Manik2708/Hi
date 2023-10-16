import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hi/connect/models/confession.dart';
import 'package:hi/connect/models/user.dart';
import 'package:hi/connect/models/user_with_chats.dart';
import 'package:hi/frontend/boxes.dart';
import 'package:hi/frontend/functions/app_is_closed.dart';
import 'package:hi/frontend/functions/firebase_notifications.dart';
import 'package:hi/frontend/functions/socket_on.dart';
import 'package:hi/frontend/providers/change_password.dart';
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
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await askForPermissions();
  socketOn();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(UserWithChatsAdapter());
  Hive.registerAdapter(ConfessionModelAdapter());
  userDataBox=await Hive.openBox('UserData');
  sentConfessionsLinkedList=await Hive.openBox('SentConfessionsLinkedList');
  recievedConfessionsLinkedList=await Hive.openBox('RecievedConfessionsLinkedList');
  chatLengths=await Hive.openBox('ChatLengths');
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (context)=>ShowPassword()),
        ChangeNotifierProvider(create: (context)=>DateOfBirth()),
        ChangeNotifierProvider(create: (context)=>UserProvider()),
        ChangeNotifierProvider(create: (context)=>SetState()),
        ChangeNotifierProvider(create: (context)=>OtpToken()),
        ChangeNotifierProvider(create: (context)=>ChangePasswordProvider()),
        ChangeNotifierProvider(create: (context)=>SearchUserProvider()),
        ],
          child:const MaterialApp(home: MyApp(),))
      );
}

class MyApp extends StatefulWidget  {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    if(state==AppLifecycleState.paused){
      try{
        debugPrint('app is closed');
        appIsClosed(context);
      }catch(e){
        debugPrint(e.toString());
      }
    }
  }
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




