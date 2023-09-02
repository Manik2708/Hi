import 'package:flutter/cupertino.dart';

class ShowPassword extends ChangeNotifier{
var _showPassword=true;
void showPassword(){
  _showPassword=false;
  notifyListeners();
}
void hidePassword(){
  _showPassword=true;
  notifyListeners();
}
get boolShowPassword=>_showPassword;
}