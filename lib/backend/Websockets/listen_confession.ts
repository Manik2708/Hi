import { Socket } from "socket.io";
import { ConfessionModel } from "../Models/confession";
import { SendConfession } from "../Sending/sendconfession";
import *  as EventNames from "../event_names"
export const listenConfession=(socket: Socket)=>{
    socket.on(EventNames.sendConfession, (data: ConfessionModel)=>{
        SendConfession(data, socket);
    })
}