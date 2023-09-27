import amqp, {Channel, Connection} from 'amqplib'

export const connectToRabit=()=>{
    amqp.connect('amqp://localhost', async function(error: any, connection: Connection){
        if(error){
            console.log(error);
        }
       try{
        const channel: Channel=await connection.createChannel();
        
       }catch(e: any){
        console.log(e.toString());
       }

    })
}