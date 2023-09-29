import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/search_user.dart';
import '../providers/user.dart';

Widget appBarWhenNotSearching( BuildContext context){
  return Row(
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
        );
}