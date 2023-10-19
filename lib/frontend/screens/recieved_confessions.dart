import 'package:flutter/material.dart';
import 'package:hi/frontend/functions/load_recieved_confessions.dart';
import 'package:hi/frontend/widgets/sent_confessions.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../connect/models/recieved_confession.dart';
import '../../constants/global_variables.dart';
import '../widgets/recieved_unread_confession.dart';
class ReceivedConfessions extends StatefulWidget {
  const ReceivedConfessions({super.key});

  @override
  State<ReceivedConfessions> createState() => _ReceivedConfessionsState();
}
class _ReceivedConfessionsState extends State<ReceivedConfessions> {
  static const _pageSize = 30;
  final PagingController<String, RecievedConfessionModel> _pagingController = PagingController(firstPageKey: 'first-page');
  @override
  void initState() {
    dateTime=DateTime.now();
    _pagingController.addPageRequestListener((pageKey) {
      controlPagination(pageKey);
    });
    // TODO: implement initState
    super.initState();
  }
  Future<void> controlPagination(String pageKey)async{
    final newItems=await loadUnreadRecievedConfessions(pageKey, context);
    final bool isLastPage=newItems.length<_pageSize;
    if(isLastPage){
      _pagingController.appendLastPage(newItems);
    }
    else{
      _pagingController.appendPage(newItems, newItems.last.id);
    }
  }
  @override
  Widget build(BuildContext context) {
    return PagedListView<String, RecievedConfessionModel>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<RecievedConfessionModel>(
          itemBuilder: (context, recievedConfessionModel, count){
            if(count==0&&dateFormatter.format(DateTime.parse(recievedConfessionModel.time))!=dateFormatter.format(DateTime.now())){
              return commonRecievedConfessionWithDate(context,recievedConfessionModel);
            }
            else if(count==0&&dateFormatter.format(DateTime.parse(recievedConfessionModel.time))==dateFormatter.format(DateTime.now())){
              return commonRecievedConfession(context,recievedConfessionModel);
            }
            else{
              return finalListRecievedConfessionWidget(context,recievedConfessionModel);
            }
          },
          firstPageProgressIndicatorBuilder: (context){
          return Center(child: LoadingAnimationWidget.fourRotatingDots(color: Colors.black, size: 50),);
          },
          noItemsFoundIndicatorBuilder: (context){
            return const Center(child: Text('No new Confessions' ),);
          },
          newPageProgressIndicatorBuilder: (context){
            return Center(child: LoadingAnimationWidget.discreteCircle(color: Colors.black, size: 50),);
          }
        ));
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pagingController.dispose();
  }
}
