import 'package:flutter/cupertino.dart';
import 'package:hi/connect/models/user_with_chats.dart';

import '../../connect/models/user.dart';

class UserProvider extends ChangeNotifier{
    User _user=User(name: '', email: '', anonymousId: '', username: '', password: '', dob: '', isEmailVerified: false, token: '', id: '');

   void setUser(Map<String, dynamic> json){
    _user=_user.fromJson(json);
    notifyListeners();
   }

   User get user=>_user;
  void setUserFromUserWithChat(UserWithChats userWithChats){
    User newUser=User(
        name: userWithChats.name,
        email: userWithChats.email,
        anonymousId: userWithChats.anonymousId,
        username: userWithChats.username,
        password: userWithChats.password,
        dob: userWithChats.dob,
        isEmailVerified: userWithChats.isEmailVerified,
        token: userWithChats.token,
        id: userWithChats.id
    );
    _user=newUser;
    notifyListeners();
  }
}