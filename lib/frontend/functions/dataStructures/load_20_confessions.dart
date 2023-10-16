import 'package:hi/connect/models/confession.dart';
import 'package:hi/frontend/boxes.dart';

void loadConfessions(List<ConfessionModel> list, bool isFirstTimeLoading){
  ConfessionModel? confessionModel;
  if(isFirstTimeLoading){
      confessionModel=sentConfessionsLinkedList.get(BoxNames.lastConfession);
      list.add(confessionModel!);
  }
  else{
    confessionModel=list.last;
  }
  for(int i=0;i<20;i++){
    if(confessionModel!.previousConfessionId==null){
      break;
    }
    confessionModel=sentConfessionsLinkedList.get(confessionModel.previousConfessionId);
    list.add(sentConfessionsLinkedList.get(confessionModel!.id)!);
  }
}

