import 'package:flutter/material.dart';
import 'package:hi/frontend/providers/search_user.dart';
import 'package:hi/frontend/widgets/searched_user_details.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}
List<String> names=[];

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Expanded(
              child: Consumer<SearchUserProvider>(
                builder:(context, state, child)=> ListView.builder(
                    itemCount: context.read<SearchUserProvider>().names.length,
                    itemBuilder: (context, int){
                     if(context.read<SearchUserProvider>().names.isNotEmpty){
                       return searchedUserDetails(state.names[int]['username']);
                     }
                     else{
                       return const Center(child: Text('Search Your Crush by their username or name'),);
                     }
                    }
                ),
              ),
            ),
        ],
      ),
    );
  }
}
