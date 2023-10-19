import 'package:flutter/material.dart';
import 'package:hi/frontend/boxes.dart';
import 'package:hi/frontend/widgets/sent_confessions.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../connect/models/confession.dart';
import '../../constants/global_variables.dart';
import '../functions/dataStructures/load_20_confessions.dart';
class SentConfessionsList extends StatefulWidget {
  const SentConfessionsList({super.key});
  @override
  State<SentConfessionsList> createState() => _SentConfessionsListState();
}
class _SentConfessionsListState extends State<SentConfessionsList>{
  final PagingController<String, ConfessionModel> _pagingController = PagingController(firstPageKey: 'first-page');
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      controlPagination(pageKey);
    });
  }
  Future<void> controlPagination(String pageKey)async{
    final newItems=await loadConfessions(pageKey);
    final bool isLastPage=newItems.length<20;
    if(isLastPage){
      _pagingController.appendLastPage(newItems);
    }
    else{
      _pagingController.appendPage(newItems, newItems.last.id);
    }
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: chatLengths.get(BoxNames.sentConfessionsLength)==null||chatLengths.get(BoxNames.sentConfessionsLength)==0?
      const Center(child: Text('Nothing to show')):PagedListView(pagingController: _pagingController, builderDelegate: PagedChildBuilderDelegate<ConfessionModel>(
        itemBuilder: (context, confessionModel, count){
          if(count==0&&dateFormatter.format(DateTime.parse(confessionModel.time))!=dateFormatter.format(DateTime.now())){
            return commonSentConfessionWithDate(context,confessionModel);
          }
          else if(count==0&&dateFormatter.format(DateTime.parse(confessionModel.time))==dateFormatter.format(DateTime.now())){
            return commonSentConfession(context,confessionModel);
          }
          else{
            return finalListSentConfessionWidget(context,confessionModel);
          }
        }
      )
      )
    );
  }
}