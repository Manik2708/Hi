import 'package:flutter/material.dart';

class DateOfBirth extends ChangeNotifier{
  String _dob='';
  String get dob=>_dob;
  void setDob(String dob){
    _dob=dob;
    notifyListeners();
  }
}