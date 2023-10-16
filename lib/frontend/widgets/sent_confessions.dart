import 'package:flutter/material.dart';
import 'package:hi/connect/models/confession.dart';
import 'package:hi/constants/global_variables.dart';
Widget commonSentConfession(BuildContext context,ConfessionModel confessionModel){
  return SizedBox(
    height: 90,
    child: GestureDetector(
      onTap: (){
          showDialog(context: context, builder: (context){
          return AlertDialog(
            actionsAlignment: MainAxisAlignment.start,
            actions: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(child: Center(child: Text(confessionModel.crushName, style: const TextStyle(fontSize: 20),)),),
                  SingleChildScrollView(
                    child: SizedBox(
                        height: 500,
                        child: Text(confessionModel.confession, style: const TextStyle(fontSize: 18),)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(child: Text(timeFormatter.format(DateTime.parse(confessionModel.time))),),
                      SizedBox(child: Text(confessionModel.status),)
                    ],
                  )
                ],
              )
            ],
          );
          });
      },
      child: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Card(
          child: Container(
            padding: const EdgeInsets.only(left: 8, top: 12),
            margin: const EdgeInsets.only(bottom: 15),
            height:65,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Row(
                    children: [
                      const Icon(Icons.account_circle_rounded, size: 50,),
                      const SizedBox(width: 5,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(child: Text(confessionModel.crushName, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),)),
                          SizedBox(child: Text(confessionModel.confession, style: const TextStyle(overflow: TextOverflow.ellipsis),)),
                          SizedBox(child: Text(timeFormatter.format(DateTime.parse(confessionModel.time))),)
                        ],
                      ),
                    ],
                  ),
                ),
                Container(alignment: Alignment.topRight,child: Text(confessionModel.status, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500), textAlign: TextAlign.end,)),
            ],
          ),
          ),
        ),
      ),
    ),
  );
}
Widget commonSentConfessionWithDate(BuildContext context,ConfessionModel confessionModel){
  return SizedBox(
    height: 120,
    child: ListView(
      physics: const NeverScrollableScrollPhysics(),
        children: [
          const SizedBox(height: 5,),
          Center(child: SizedBox(height: 20,child: Text(dateFormatter.format(DateTime.parse(confessionModel.time)), style: const TextStyle(color: Colors.black),))),
          const SizedBox(height: 5,),
          commonSentConfession(context, confessionModel)
        ],
    ),
  );
}
Widget finalListSentConfessionWidget(BuildContext context,ConfessionModel confessionModel, ConfessionModel nextConfessionModel){
    if (dateFormatter.format(DateTime.parse(confessionModel.time))==dateFormatter.format(DateTime.parse(nextConfessionModel.time))) {
      return commonSentConfession(context, confessionModel);
    }
    else{
      return commonSentConfessionWithDate(context,confessionModel);
    }
}




