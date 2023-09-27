import { ifUserIsOnline } from "../OnlineUsers/if_user_online";
import { Socket } from "socket.io";
import {client} from "..";
import { ConfessionModel } from "../Models/confession";
import * as EventNames from "../event_names"

export const SendConfession=async(confession: ConfessionModel, socket: Socket)=>{
   try{
    const checkOnlineUser=await ifUserIsOnline(confession.CrushId);
   if(checkOnlineUser==1){
    const socketid=await client.get(confession.CrushId);
    socket.to(socketid!).emit(EventNames.recieveConfession, JSON.stringify(confession));
   }
   else{
      console.log('User is offline');
   }
   }catch(e: any){
    console.log(e.toString());
   }
}