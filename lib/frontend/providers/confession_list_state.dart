import 'package:flutter/foundation.dart';

class ConfessionList extends ChangeNotifier{
  DateTime _dateTime=DateTime.now();
  DateTime get dateTime=>_dateTime;
  void setSentConfessionState(DateTime date){
    _dateTime=date;
    notifyListeners();
  }
}