import 'package:flutter/material.dart';
import 'package:hi/frontend/functions/socket_on.dart';
import 'package:hi/frontend/providers/search_user.dart';
import 'package:hi/frontend/screens/main_screen.dart';
import 'package:hi/frontend/screens/search_screen.dart';
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
        title: const CustomSearchBar(),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white,),
          onPressed: (){}
        ),
      ),
      body: Consumer<SearchUserProvider>(
        builder: (context, state, child){
          if(state.ifSearchingUser){
            return const SearchScreen();
          }
          return const MainScreen();
          },
      )
    );
  }
}
