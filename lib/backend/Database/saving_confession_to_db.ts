import { QueueNames } from "../APIs/queues_redis";
import { socketfotApis } from "../Websockets/base";
import { recievingChannelForApis, sendingChannelForApis } from "../queues/base";
import * as EventNames from "../event_names"
import { User } from "./Models/user";
import { ConfessionModel } from "../Models/confession";

export const saveConfessionToDb=async(CrushId: string,confession: ConfessionModel):Promise<boolean>=>{
    try{
        sendingChannelForApis.assertQueue(QueueNames.ConfessionQueue+CrushId, {durable: true});
    sendingChannelForApis.sendToQueue(QueueNames.ConfessionQueue+CrushId, Buffer.from(JSON.stringify(confession)))
    recievingChannelForApis.assertQueue(QueueNames.ConfessionQueue+CrushId, {durable: true})
    recievingChannelForApis.consume(QueueNames.ConfessionQueue+CrushId, async(msg)=>{
        const recievedConfession=JSON.parse(msg!.content.toString());
        await User.updateOne({_id: recievedConfession.SenderId}, {$push:{sentConfessions: recievedConfession}});
        await User.updateOne({_id: recievedConfession.CrushId}, {$push:{recievedConfessions: recievedConfession}});
        })
    return true;
    }
    catch(e: any){
        return false;
    }
}