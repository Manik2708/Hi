import 'package:flutter/material.dart';

class SetState extends ChangeNotifier{
  String _verifyPhone='Click on Send button to receive an OTP';
  Color _verifyPhoneBtnClr=const Color.fromARGB(255, 119, 31, 152);
  String _verifyPhoneBtnTxt='Send OTP';
  VoidCallback _onPhoneVerifyClick=(){};
  Color _timerTextColor=Colors.white;
  String get verifyPhone=>_verifyPhone;
  Color get verifyPhoneBtnClr=>_verifyPhoneBtnClr;
  String get verifyPhoneBtnTxt=>_verifyPhoneBtnTxt;
  VoidCallback get onPhoneVerifyClick=>_onPhoneVerifyClick;
  Color get timerTextColor=>_timerTextColor;
  void setVerifyPhone(String source){
    _verifyPhone=source;
    notifyListeners();
  }
  void setVerifyPhoneBtnClr(Color color){
    _verifyPhoneBtnClr=color;
    notifyListeners();
  }
  void setVerifyPhoneBtnTxt(String source){
    _verifyPhoneBtnTxt=source;
    notifyListeners();
  }
  void setOnPhoneClick(VoidCallback onClick){
    _onPhoneVerifyClick=onClick;
    notifyListeners();
  }
  void setTimerColor(Color color){
    _timerTextColor=color;
    notifyListeners();
  }
  void resetProvider(){
    setVerifyPhone('Click on Send button to receive an OTP');
    setTimerColor(Colors.white);
    setOnPhoneClick(() { });
    setVerifyPhoneBtnTxt('Send OTP');
    setVerifyPhoneBtnClr(const Color.fromARGB(255, 119, 31, 152));
  }
}