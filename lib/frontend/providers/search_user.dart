import 'package:flutter/widgets.dart';

class SearchUserProvider extends ChangeNotifier{
  bool _ifSearchingUser=false;
   List<dynamic> _names=[];
  bool get ifSearchingUser=>_ifSearchingUser;
  List<dynamic> get names=>_names;
  void setBool(bool source){
    _ifSearchingUser=source;
    notifyListeners();
  }
  void addSearchedUser(List<dynamic> source){
   _names=source;
    notifyListeners();
  }
  void clearList(){
    _names=[];
    notifyListeners();
  }
}