import 'package:flutter/foundation.dart';

class ChangePasswordProvider extends ChangeNotifier{
  String _email='';
  String _otptoken='';
  String _id='';
  bool _onVerificationScreen=false;
  String get email=>_email;
  String get otptoken=>_otptoken;
  String get id=>_id;
  bool get onVerificationScreen=>_onVerificationScreen;
  void set(String otptoken, String id, String email){
    _otptoken=otptoken;
    _id=id;
    _email=email;
    notifyListeners();
  }
  void setOnVerificationScreen(bool set){
    _onVerificationScreen=set;
    notifyListeners();
  }
}