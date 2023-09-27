import express from "express";
import { authMiddlewre } from "../Middlewares/user";
import { ifUserIsOnline } from "../OnlineUsers/if_user_online";
import { ConfessionDb } from "../Database/Models/confession";


const sendConfession=express.Router();

sendConfession.post('/send-confession', authMiddlewre, async(req, res)=>{
    const {SenderId, SenderAnonymousId, CrushId, Confession,  Time}=req.body;
    let confession=new ConfessionDb({
        SenderId: SenderId,
        SenderAnonymousId: SenderAnonymousId,
        CrushId: CrushId,
        Confession: Confession,
        Time: Time,
        status: 'Sending'
    });
    confession= await confession.save();
    const userOnlineOrNot=await ifUserIsOnline(CrushId);
    if(userOnlineOrNot==1){
       
    }
    else{
        
    }
})