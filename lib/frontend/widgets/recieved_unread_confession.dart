import 'package:flutter/material.dart';
import 'package:hi/connect/models/recieved_confession.dart';
import 'package:hi/constants/global_variables.dart';
import 'package:hi/frontend/widgets/sent_confessions.dart';
Widget commonRecievedConfession(BuildContext context,RecievedConfessionModel confessionModel){
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
                  SizedBox(child: Center(child: Text(confessionModel.senderAnonymousId, style: const TextStyle(fontSize: 20),)),),
                  SingleChildScrollView(
                    child: SizedBox(
                        height: 500,
                        child: Text(confessionModel.confession, style: const TextStyle(fontSize: 18),)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(child: Text(timeFormatter.format(DateTime.parse(confessionModel.time))),),
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
                          SizedBox(child: Text(confessionModel.senderAnonymousId, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),)),
                          SizedBox(height: 20,child: Text(confessionModel.confession, style: const TextStyle(overflow: TextOverflow.ellipsis),)),
                          SizedBox(child: Text(timeFormatter.format(DateTime.parse(confessionModel.time))),)
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
Widget commonRecievedConfessionWithDate(BuildContext context,RecievedConfessionModel confessionModel){
  return SizedBox(
    height: 120,
    child: ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const SizedBox(height: 5,),
        Center(child: SizedBox(height: 20,child: Text(dateFormatter.format(DateTime.parse(confessionModel.time)), style: const TextStyle(color: Colors.black),))),
        const SizedBox(height: 5,),
        commonRecievedConfession(context, confessionModel)
      ],
    ),
  );
}

Widget finalListRecievedConfessionWidget(BuildContext context,RecievedConfessionModel confessionModel){
  if (dateFormatter.format(DateTime.parse(confessionModel.time))==dateFormatter.format(dateTime)) {
    return commonRecievedConfession(context, confessionModel);
  }
  else{
    dateTime=DateTime.parse(confessionModel.time);
    return commonRecievedConfessionWithDate(context,confessionModel);
  }
}