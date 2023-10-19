import 'package:flutter/cupertino.dart';
import 'package:hi/connect/models/confession.dart';
import 'package:hi/frontend/boxes.dart';

Future<List<ConfessionModel>> loadConfessions(String pageKey)async{
  List<ConfessionModel> list=[];
  ConfessionModel? confessionModel;
  if(pageKey=='first-page'){
      confessionModel=sentConfessionsLinkedList.get(BoxNames.lastConfession);
      list.add(confessionModel!);
  }
  else{
    confessionModel=sentConfessionsLinkedList.get(pageKey);
  }
  for(int i=0;i<20;i++){
    if(confessionModel!.previousConfessionId==null){
      break;
    }
    confessionModel=sentConfessionsLinkedList.get(confessionModel.previousConfessionId);
    list.add(sentConfessionsLinkedList.get(confessionModel!.id)!);
  }
  return list;
}

