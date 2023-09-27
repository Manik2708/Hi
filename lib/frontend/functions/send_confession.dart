import 'package:flutter/cupertino.dart';
import 'package:hi/connect/models/confession.dart';
import 'package:hi/connect/models/crush_model.dart';
import 'package:hi/constants/global_variables.dart';
import 'package:hi/frontend/functions/socket_on.dart';
import 'package:hi/frontend/providers/user.dart';
import 'package:provider/provider.dart';

void sendConfession(CrushModel crush, BuildContext context, String Confession){
  ConfessionModel confession=ConfessionModel(
      id: '',
      SenderId: context.read<UserProvider>().user.id,
      SenderAnonymousId: context.read<UserProvider>().user.anonymousId,
      CrushId: crush.id,
      Confession: Confession,
      Time: DateTime.now().toString(),
    status: ''
  );
  socket!.emit(EventNames.sendConfession, confession);
}