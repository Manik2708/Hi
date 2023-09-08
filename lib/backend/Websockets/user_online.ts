import {Socket} from 'socket.io';
import { OnlineUsers } from '../Models/online_user';
import * as EventNames from '../event_names';

export const onlineUsers=(socket: Socket)=>{
    socket.on(EventNames.onlineUsers,(data: String)=>{
        OnlineUsers.set(data, socket.id);
    })
}