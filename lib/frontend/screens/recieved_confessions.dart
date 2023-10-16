import 'package:flutter/material.dart';
import 'package:hi/frontend/functions/load_recieved_confessions.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../connect/models/recieved_confession.dart';
class ReceivedConfessions extends StatefulWidget {
  const ReceivedConfessions({super.key});

  @override
  State<ReceivedConfessions> createState() => _ReceivedConfessionsState();
}
class _ReceivedConfessionsState extends State<ReceivedConfessions> {
  static const _pageSize = 30;
  final PagingController<String, RecievedConfessionModel> _pagingController = PagingController(firstPageKey: 'first-page');
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
    return const Scaffold();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pagingController.dispose();
  }
}
