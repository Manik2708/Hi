import 'package:flutter/material.dart';
import 'package:hi/frontend/functions/searched_user_list.dart';
import 'package:hi/frontend/functions/socket_on.dart';
import 'package:hi/frontend/providers/search_user.dart';
import 'package:provider/provider.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 300,
      child: TextField(
        onChanged: (newText){
         if(newText.trim().isNotEmpty){
           socket!.emit('searchUser', newText);
           getUserList(context);
         }
         else{
           context.read<SearchUserProvider>().clearList();
           context.read<SearchUserProvider>().setBool(false);
           socket!.off('searchedUser');
         }
        },
      ),
    );
  }
}
