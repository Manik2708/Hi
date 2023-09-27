import {client} from '..';

export const ifUserIsOnline=async(userId: string): Promise<number>=>{
   try{
    return client.sismember('online-users', userId);
   }
   catch(e: any){
    console.log(e.toString());
    return 0;
   }
}