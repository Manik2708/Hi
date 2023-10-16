import 'package:hi/connect/models/confession.dart';
import 'package:hi/connect/models/user_with_chats.dart';
import 'package:hive_flutter/hive_flutter.dart';

late Box<UserWithChats> userDataBox;
late Box<ConfessionModel> sentConfessionsLinkedList;
late Box<ConfessionModel> recievedConfessionsLinkedList;
late Box<int> chatLengths;

class BoxNames{
  static const String userData='userdata';
  static const String sentConfessionsList='sent-confessions-list';
  static const String recievedConfessionsList='recieved-confessions-list';
  static const String firstConfession='first-confession-id';
  static const String lastConfession='last-confession-id';
  static const String sentConfessionsLength='sent-confessions-length';
  static const String recievedConfessionsLength='recieved-confessions-length';
}


void saveSentConfession(ConfessionModel confession){
  confession.status='Sent';
  if(sentConfessionsLinkedList.get(BoxNames.firstConfession)==null){
    sentConfessionsLinkedList.put(BoxNames.firstConfession, confession);
    sentConfessionsLinkedList.put(BoxNames.lastConfession, confession);
    chatLengths.put(BoxNames.sentConfessionsLength, 1);
  }
  else{
    ConfessionModel lastConfession=sentConfessionsLinkedList.get(BoxNames.lastConfession)!;
    int currentLength=chatLengths.get(BoxNames.sentConfessionsLength)!;
    confession.previousConfessionId=lastConfession.id;
    sentConfessionsLinkedList.put(confession.id, confession);
    sentConfessionsLinkedList.put(BoxNames.lastConfession, confession);
    currentLength+=1;
    chatLengths.put(BoxNames.sentConfessionsLength, currentLength);
  }
}