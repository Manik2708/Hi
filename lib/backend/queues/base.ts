import amqp, {Channel, Connection} from 'amqplib'

var sendingChannelForApis: Channel;
var recievingChannelForApis: Channel;
export const connectToRabit=()=>{
    amqp.connect('amqp://localhost', async function(error: any, connection: Connection){
        if(error){
            console.log(error);
        }
       try{
        const sendingChannel: Channel=await connection.createChannel();
        const recievingChannel: Channel=await connection.createChannel();
        sendingChannelForApis=sendingChannel
        recievingChannelForApis=recievingChannel
       }catch(e: any){
        console.log(e.toString());
       }

    })
}

export {sendingChannelForApis, recievingChannelForApis}