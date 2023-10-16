// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../connect/models/user_with_chats.dart';
import '../boxes.dart';
import '../providers/user.dart';
import '../widgets/dialogue_box.dart';
import '../../connect/models/user.dart';


Future<User> getUserDataFromCache(BuildContext context) async {
  User user=User(name: '', email: '', anonymousId: '', username: '', password: '', dob: '',  isEmailVerified: false, token: '', id: '');
  try {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    String? token=prefs.getString('token');
    if(token==null){
      prefs.setString('token', '');
      token='';
    }
    if(token.isEmpty){
      return user;
    }
    UserWithChats? userWithChats=userDataBox.get(BoxNames.userData);
    context.read<UserProvider>().setUserFromUserWithChat(userWithChats!);
    user=context.read<UserProvider>().user;
    return user;
  }catch(e){
    showDialogBox(context: context, title: 'Error', content: e.toString(), buttonText: null, onClick: null);
    return user;
  }
}