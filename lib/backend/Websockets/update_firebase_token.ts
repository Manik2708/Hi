import *  as EventNames from "../event_names"
import { Socket } from "socket.io";
import {client} from '..';

export const updateFirebaseConfessionFxn=async(socket: Socket)=>{
    try{
        socket.on(EventNames.updateFirebaseConfession, async(data)=>{
            await client.hset(data.id, {
                'firebasetoken': data.token
            })
        });
    }catch(e: any){
        console.log(e.toString());
    }
}