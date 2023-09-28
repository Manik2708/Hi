import express from "express";
import { authMiddlewre } from "../Middlewares/user";
import { ifUserIsOnline } from "../OnlineUsers/if_user_online";
import { ConfessionDb } from "../Database/Models/confession";
import { client } from "..";
import { socketfotApis } from "../Websockets/base";
import * as EventNames from "../event_names"
import { RedisNames } from "./queues_redis";
import { saveConfessionToDb } from "../Database/saving_confession_to_db";
import { getFirebaseToken } from "../functions/get_firebase_token";
const sendConfession=express.Router();

sendConfession.post('/send-confession', authMiddlewre, async(req, res)=>{
    try{
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
    
    const ifSaved=await saveConfessionToDb(confession.CrushId, confession)
    if(ifSaved){
        const userOnlineOrNot=await ifUserIsOnline(CrushId);
        await ConfessionDb.updateOne({_id: confession._id}, {status: 'Sent'})
        if(userOnlineOrNot){
            const socketid=await client.hGet(RedisNames.OnlineUserMap+CrushId,RedisNames.SocketId);
            socketfotApis.to(socketid!).emit(EventNames.recieveConfession, confession);
            return res.status(200).json(confession)
        }
        else{
            const firebaseToken=await getFirebaseToken(confession.CrushId)
            if(firebaseToken=='false'){
                return res.status(500).json({"msg": 'Error'}); 
            }
            else{
                const message = {
                    data: {
                      title: 'Hi, You have a confession',
                      content: confession.Confession.length>=20?confession.Confession.substring(0, 20)+'...':confession.Confession.substring(0, confession.Confession.length-1)+'...'
                    },
                    token: firebaseToken
                  };
                 
                

            }

        }
    }
    else{
        return res.status(500).json({"msg": 'Error'}); 
    }
    }catch(e: any){
        return res.status(500).json({"msg": e.message});
    }
})
export {sendConfession}