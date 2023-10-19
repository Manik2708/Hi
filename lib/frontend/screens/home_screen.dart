// ignore_for_file: use_build_context_synchronously
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:hi/frontend/functions/firebase_notifications.dart';
import 'package:hi/frontend/functions/send_token_from_screen.dart';
import 'package:hi/frontend/functions/socket_on.dart';
import 'package:hi/frontend/providers/search_user.dart';
import 'package:hi/frontend/providers/user.dart';
import 'package:hi/frontend/screens/main_screen.dart';
import 'package:hi/frontend/screens/recieved_confessions.dart';
import 'package:hi/frontend/screens/search_screen.dart';
import 'package:hi/frontend/screens/sent_confessions_list.dart';
import 'package:hi/frontend/widgets/app_bar_when_not_searching.dart';
import 'package:hi/frontend/widgets/dialogue_box.dart';
import 'package:hi/frontend/widgets/search_bar.dart';
import 'package:provider/provider.dart';
import '../../constants/global_variables.dart';

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
    socketOn(context);
    getToken(context);
    setupInteractedMessage();
    receiveForegroundNotification(() {
      setState(() {
        applyChanges=2;
      });
    });
  }

  void setTheUserOnline()async{
    setUserOnline(context);
    socket!.on(EventNames.recieveConfession, (data) => showDialogBox(context: context, title: 'Confession', content: 'Confession recieved', buttonText: null, onClick: null));
    socket!.emit(EventNames.recieveAllMessages, {
      'id': context.read<UserProvider>().user.id
    });
  }
  Future<void> setupInteractedMessage() async {
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
    setState(() {
      applyChanges=2;
    });
  }

  static const List<Widget> screens=[
     MainScreen(),
     SentConfessionsList(),
     ReceivedConfessions()
  ];
  int applyChanges=0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:()async{
        SystemNavigator.pop();
        FlutterExitApp.exitApp();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          actions: [
               Consumer<SearchUserProvider>(builder: (context, state, child)=>
                   state.ifSearchButtonClicked==false?appBarWhenNotSearching(context):const Row(
                     children: [
                       CustomSearchBar(),
                       SizedBox(width: 30,)
                     ],
                   )
               )
             ],
          automaticallyImplyLeading: false,
        ),
        body: Consumer<SearchUserProvider>(
          builder: (context, state, child){
            if(state.ifSearchingUser){
              return const SearchScreen();
            }
            return screens[applyChanges];
            },
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: applyChanges,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.send), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: '')
          ],
          onTap: (selectedScreen){
            setState(() {
              applyChanges=selectedScreen;
            });
          },
        ),
      ),
    );
  }
}
