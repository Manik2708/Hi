import 'package:flutter/cupertino.dart';

class OtpToken extends ChangeNotifier{
  String _otpToken='';
  String get otpToken=>_otpToken;
  void setToken(String source){
    _otpToken=source;
    notifyListeners();
  }
}