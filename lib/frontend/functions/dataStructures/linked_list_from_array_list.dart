import 'package:hi/frontend/boxes.dart';
import 'package:hive/hive.dart';

import '../../../connect/models/confession.dart';

void convertAndSaveConfessionToLinkedList(List<ConfessionModel> list, Box<ConfessionModel> hiveBox, Box<int> chatLength, String key){
  for(int i=0;i<list.length;i++){
    if(i>0){
      list[i].previousConfessionId=list[i-1].id;
    }
    if(i==0){
      hiveBox.put(BoxNames.firstConfession, list[i]);
    }
    if(i==list.length-1){
      hiveBox.put(BoxNames.lastConfession, list[i]);
    }
    hiveBox.put(list[i].id, list[i]);
  }
  chatLength.put(key, list.length);
}