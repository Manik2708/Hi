import 'package:flutter/cupertino.dart';
import 'package:hi/frontend/functions/socket_on.dart';
import 'package:hi/frontend/providers/user.dart';
import 'package:provider/provider.dart';
import '../../constants/global_variables.dart';

void appIsClosed(BuildContext context){
  if(context.read<UserProvider>().user.token.isNotEmpty&&context.read<UserProvider>().user.isEmailVerified==true){
    debugPrint('offline');
    socket!.emit(EventNames.appIsClosed, {
      'id': context.read<UserProvider>().user.id
    });
    debugPrint('closed');
  }
}