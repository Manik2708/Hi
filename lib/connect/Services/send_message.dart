import 'package:hi/constants/global_variables.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

void sendMessage(){
  io.Socket socket=io.io(Uri.parse(uri));
  socket.emit('msg', 'hello');
}