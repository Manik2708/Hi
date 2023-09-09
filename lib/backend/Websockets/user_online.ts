import {Socket} from 'socket.io';
import { OnlineUsers } from '../Models/online_user';
import * as EventNames from '../event_names';
import jwt from 'jwt-simple'
import { User } from '../Database/Models/user';

export const onlineUsers=(socket: Socket)=>{
    socket.on(EventNames.onlineUsers,async(data: string)=>{
        if(data.trim().length==0){
          socket.to(socket.id).emit(EventNames.noToken)  
        }
        else{
        const verify=jwt.decode(data, 'token');
        if(!verify){
            socket.to(socket.id).emit(EventNames.invalidToken)
        }
        else{
        const user=await User.findById(verify.id);
        if(user==null){
            socket.to(socket.id).emit(EventNames.userNotFound);
        }
        else{
            OnlineUsers.set(verify.id, socket.id);
        }
}
        }

        })
}