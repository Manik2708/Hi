import { ioServer } from "..";
import { onlineUsers } from "./user_online";
import * as EventNames from '../event_names';

function connectToSocket(){
try{
ioServer.on('connection', (socket)=>{
    console.log('Connection To Sockets Successful '+socket.id);
    socket.to(socket.id).emit(EventNames.socketId, socket.id);
    onlineUsers(socket);
});
}catch(e: any){
    console.log(e);
}
}

export{connectToSocket};


