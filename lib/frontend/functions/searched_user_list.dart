

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hi/frontend/functions/socket_on.dart';
import 'package:hi/frontend/providers/search_user.dart';
import 'package:provider/provider.dart';

  void getUserList(BuildContext context) {
  try{
    socket!.on('searchedUser', (data)
    {

      context.read<SearchUserProvider>().addSearchedUser(jsonDecode(data));
    }
    );
  }catch(e){
    debugPrint(e.toString());
  }
}