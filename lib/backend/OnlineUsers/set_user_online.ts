import {client} from '..';
import { Socket } from 'socket.io';
export const UserOnline=async(userId: string, socket: Socket)=>{
try{
    await client.sadd('online-users', userId);
    await client.hset(userId, {
        'socketId': socket.id
    })
}
catch(e: any){
    console.log(e.toString());
}
}