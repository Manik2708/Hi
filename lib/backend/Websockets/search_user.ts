import { Socket } from "socket.io";
import * as EventNames from '../event_names';
import { User } from "../Database/Models/user";

export const searchUser=(socket: Socket)=>{
    socket.on(EventNames.searchUser, async(data: String)=>{
        const UserList=await User.find({name: data});
        socket.to(socket.id).emit(EventNames.searchedUser, UserList);
    })
}