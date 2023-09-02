import 'package:flutter/cupertino.dart';

import '../../connect/models/user.dart';

class UserProvider extends ChangeNotifier{
    User _user=User(name: '', email: '', anonymousId: '', username: '', password: '', dob: '', isEmailVerified: false, token: '', id: '');

   void setUser(Map<String, dynamic> json){
    _user=_user.fromJson(json);
    notifyListeners();
   }
   User get user=>_user;

}