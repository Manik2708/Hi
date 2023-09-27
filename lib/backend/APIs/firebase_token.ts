import express from 'express'
import { authMiddlewre } from '../Middlewares/user';
import {client} from '..';
export const saveFirebaseToken=express.Router();

saveFirebaseToken.post('/firebase-token',authMiddlewre, async(req, res)=>{
    try{
        const userId=res.locals.id;
    const {token}=req.body;
    await client.hset(userId, {
        'firebasetoken': token
    })
    res.status(200).json(token);
    }catch(e: any){
        res.status(500).json(e.toString());
    }
})