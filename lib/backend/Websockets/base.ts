import { ioServer } from "..";
import { onlineUsers } from "./user_online";
import * as EventNames from '../event_names';
import { searchUser } from "./search_user";
import { listenConfession } from "./listen_confession";
import { updateFirebaseConfessionFxn } from "./update_firebase_token";

function connectToSocket(){
try{
ioServer.on('connection', (socket)=>{
    console.log('Connection To Sockets Successful '+socket.id);
    socket.emit(EventNames.socketId, socket.id);
    onlineUsers(socket);
    searchUser(socket);
    listenConfession(socket);
    updateFirebaseConfessionFxn(socket);
});
}catch(e: any){
    console.log(e);
}
}

export{connectToSocket};


