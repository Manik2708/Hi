import 'package:flutter/material.dart';
import 'package:hi/frontend/functions/searched_user_list.dart';
import 'package:hi/frontend/functions/socket_on.dart';
import 'package:hi/frontend/providers/search_user.dart';
import 'package:hi/frontend/providers/user.dart';
import 'package:provider/provider.dart';
import 'package:hi/constants/global_variables.dart';
class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.only(top: 10),
      width: 350,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: MediaQuery.of(context).size.width*0.038,),
          Container(
            width: MediaQuery.of(context).size.width*0.85,
            height: 55,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 0, top: 0, bottom: 55),
                prefix: IconButton(onPressed: (){
                  context.read<SearchUserProvider>().setSearchButtonClicked(false);
                  context.read<SearchUserProvider>().setBool(false);
                  },icon: const Icon(Icons.arrow_back,color: Colors.black,size: 20,),),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                )
              ),
              style: const TextStyle(
                fontSize: 16
              ),
              onChanged: (newText){
               if(newText.trim().isNotEmpty){
                 context.read<SearchUserProvider>().setBool(true);
                 socket!.emit(EventNames.searchUser,
                     {"query": newText,
                       "id": context.read<UserProvider>().user.id
                     }
                   );
                 getUserList(context);
               }
               else{
                 context.read<SearchUserProvider>().clearList();
                 context.read<SearchUserProvider>().setBool(false);
                 socket!.off(EventNames.searchedUser);
               }
              },
            ),
          ),
        ],
      ),
    );
  }
}
