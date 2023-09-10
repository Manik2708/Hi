import 'package:flutter/material.dart';
import 'package:hi/frontend/functions/socket_on.dart';
import 'package:hi/frontend/providers/search_user.dart';
import 'package:hi/frontend/providers/user.dart';
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
        actions: [
             Consumer<SearchUserProvider>(builder: (context, state, child)=>
                 state.ifSearchButtonClicked==false?Row(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     IconButton(onPressed: (){}, icon: const Icon(Icons.account_circle_rounded, size: 52,), color: Colors.black,),
                     Container(
                       padding: const EdgeInsets.only(top:15, left: 10),
                       child: SizedBox(
                         width: 75,
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(context.read<UserProvider>().user.name, style: const TextStyle(color: Colors.black, fontSize: 20), overflow: TextOverflow.ellipsis,),
                             const SizedBox(height: 2,),
                             Text(context.read<UserProvider>().user.username, style: const TextStyle(color: Colors.grey, fontSize: 10),overflow: TextOverflow.ellipsis),
                           ],
                         ),
                       ),
                     ),
                     const SizedBox(width: 200,),
                     Padding(
                       padding: const EdgeInsets.only(left: 10),
                       child: IconButton(onPressed: (){context.read<SearchUserProvider>().setSearchButtonClicked(true);}, icon: const Icon(Icons.person_search, color: Colors.black, size: 35,)),
                     ),
                   ],
                 ):const Row(
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
          return const MainScreen();
          },
      )
    );
  }
}
