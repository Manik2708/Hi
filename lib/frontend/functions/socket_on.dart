import 'package:flutter/cupertino.dart';
import 'package:hi/constants/global_variables.dart';
import 'package:hi/frontend/providers/user.dart';
import 'package:hi/frontend/widgets/dialogue_box.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

io.Socket? socket;

void socketOn(BuildContext context){
  try{
     socket=io.io(uri, <String, dynamic>{
        'transports': ['websocket'],
      });
      socket!.on('connect', (data) {
        socket!.emit(EventNames.userOnline, context.read<UserProvider>().user.token);
      });
  }
  catch(e){
    debugPrint(e.toString());
  }
}

void setUserOnline(BuildContext context){
  try{
    socket!.emit(EventNames.userOnline, context.read<UserProvider>().user.token);
  }catch(e){
    showDialogBox(context: context, title: 'Error', content: e.toString(), buttonText: null, onClick: null);
  }
}