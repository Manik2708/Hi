import 'package:hi/connect/models/confession.dart';
import 'package:hi/connect/models/user_with_chats.dart';
import 'package:hive_flutter/hive_flutter.dart';

late Box<UserWithChats> userDataBox;
late Box<List> sentConfessions;
late Box<List> recievedConfessions;

class BoxNames{
  static const String userData='userdata';
  static const String sentConfessionsList='sent-confessions-list';
  static const String recievedConfessionsList='recieved-confessions-list';
}


void saveSentConfession(ConfessionModel confession){
  List<ConfessionModel> sentConfessionsList=sentConfessions.get(BoxNames.sentConfessionsList)!.cast<ConfessionModel>();
  sentConfessionsList.add(confession);
  sentConfessions.put(BoxNames.sentConfessionsList, sentConfessionsList);
}