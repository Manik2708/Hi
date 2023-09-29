// ignore_for_file: use_build_context_synchronously


import 'package:flutter/material.dart';
import 'package:hi/frontend/functions/send_token_from_screen.dart';
import 'package:hi/frontend/functions/socket_on.dart';
import 'package:hi/frontend/providers/search_user.dart';
import 'package:hi/frontend/screens/main_screen.dart';
import 'package:hi/frontend/screens/recieved_confessions.dart';
import 'package:hi/frontend/screens/search_screen.dart';
import 'package:hi/frontend/screens/sent_confessions.dart';
import 'package:hi/frontend/widgets/app_bar_when_not_searching.dart';
import 'package:hi/frontend/widgets/search_bar.dart';
import 'package:provider/provider.dart';

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
    getToken(context);
  }
  void connectSocket()async{
    socketOn(context);
  }
  static const List<Widget> screens=[
     MainScreen(),
     SentConfession(),
     ReceivedConfessions()
  ];
  int applyChanges=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
