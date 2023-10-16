import 'package:flutter/material.dart';
import 'package:hi/frontend/boxes.dart';
import 'package:hi/frontend/widgets/sent_confessions.dart';
import '../../connect/models/confession.dart';
import '../../constants/global_variables.dart';
import '../functions/dataStructures/load_20_confessions.dart';
class SentConfessionsList extends StatefulWidget {
  const SentConfessionsList({super.key});
  @override
  State<SentConfessionsList> createState() => _SentConfessionsListState();
}
class _SentConfessionsListState extends State<SentConfessionsList>{
  final ScrollController _controller=ScrollController();
  List<ConfessionModel> list=[];
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    loadConfessions(list, true);
    _controller.addListener(() {
      if(list.length==chatLengths.get(BoxNames.sentConfessionsLength)){
        return;
      }
     if(_controller.position.maxScrollExtent==_controller.offset){
       loadConfessions(list, false);
     }
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: chatLengths.get(BoxNames.sentConfessionsLength)==null||chatLengths.get(BoxNames.sentConfessionsLength)==0?
      const Center(child: Text('Nothing to show')):ListView.builder(
          controller: _controller,
          itemCount: chatLengths.get(BoxNames.sentConfessionsLength),
          itemBuilder: (context, count){
            if(count==0&&dateFormatter.format(DateTime.parse(list[count].time))!=dateFormatter.format(DateTime.now())){
              return commonSentConfessionWithDate(context,list[count]);
            }
            else if(count==0&&dateFormatter.format(DateTime.parse(list[count].time))==dateFormatter.format(DateTime.now())){
              return commonSentConfession(context,list[count]);
            }
            else{
              return finalListSentConfessionWidget(context,list[count],list[count-1]);
            }
          }
          ),
    );
  }
}

