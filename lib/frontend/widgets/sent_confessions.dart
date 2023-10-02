import 'package:flutter/material.dart';
import 'package:hi/connect/models/confession.dart';
import 'package:hi/constants/global_variables.dart';
import 'package:hi/frontend/providers/confession_list_state.dart';
import 'package:provider/provider.dart';


Widget sentConfessionsWidget(BuildContext context, ConfessionModel confessionModel){
  DateTime dateTime=context.read<ConfessionList>().dateTime;
  if(dateFormatter.format(dateTime)==dateFormatter.format(DateTime.parse(confessionModel.time))){
    return GestureDetector(
      onTap: (){},
      child: Card(
        child: Container(
          padding: const EdgeInsets.only(left: 8, top: 12),
          margin: const EdgeInsets.only(bottom: 15),
          height:65,
          width: 300,child: Row(
          children: [
            const Icon(Icons.account_circle_rounded, size: 50,),
            const SizedBox(width: 5,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 270,child: Text(confessionModel.crushName, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),)),
                SizedBox(width: 270,child: Text(confessionModel.confession, style: const TextStyle(overflow: TextOverflow.ellipsis),)),
                SizedBox(width: 270, child: Text(timeFormatter.format(DateTime.parse(confessionModel.time))),)
              ],
            ),
            const Icon(Icons.arrow_forward_ios)
          ],
        ),
        ),
      ),
    );
  }
  else{
  context.read<ConfessionList>().setSentConfessionState(DateTime.parse(confessionModel.time));
  return Column(
    children: [
      Center(child: Text(dateFormatter.format(DateTime.parse(confessionModel.time))),),
      GestureDetector(
        onTap: (){},
        child: Card(
          child: Container(
            padding: const EdgeInsets.only(left: 8, top: 12),
            margin: const EdgeInsets.only(bottom: 15),
            height:65,
            width: 300,child: Row(
            children: [
              const Icon(Icons.account_circle_rounded, size: 50,),
              const SizedBox(width: 5,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 270,child: Text(confessionModel.crushName, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),)),
                  SizedBox(width: 270,child: Text(confessionModel.confession, style: const TextStyle(overflow: TextOverflow.ellipsis),)),
                  SizedBox(width: 270, child: Text(timeFormatter.format(DateTime.parse(confessionModel.time))),)
                ],
              ),
              const Icon(Icons.arrow_forward_ios)
            ],
          ),
          ),
        ),
      ),
    ],
  );
  }

}
