import 'package:flutter/material.dart';
import 'package:hi/connect/models/confession.dart';
import 'package:hi/frontend/boxes.dart';
import 'package:hi/frontend/widgets/sent_confessions.dart';

class SentConfessionsList extends StatefulWidget {
  const SentConfessionsList({super.key});

  @override
  State<SentConfessionsList> createState() => _SentConfessionsListState();
}

class _SentConfessionsListState extends State<SentConfessionsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: sentConfessions.get(BoxNames.sentConfessionsList)==null||sentConfessions.get(BoxNames.sentConfessionsList)!.cast<ConfessionModel>().isEmpty?
      const Center(child: Text('Nothing to show'),): ListView.builder(
          itemCount: sentConfessions.get(BoxNames.sentConfessionsList)!.length,
          itemBuilder: (context, count)=>
        sentConfessionsWidget(context, sentConfessions.get(BoxNames.sentConfessionsList)!.cast<ConfessionModel>()[(sentConfessions.get(BoxNames.sentConfessionsList)!.length-1)-count])
        ),
    );
  }
}
