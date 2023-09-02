import express from 'express';
import mongoose from 'mongoose';
import {createAccount} from './APIs/create_account';
import { tokenValidator } from './APIs/token_validation';
import { getData } from './APIs/provide_data';
import { verifyOTP } from './APIs/verify_otp';
import { sendOTP } from './APIs/send_otp';
const Db="mongodb+srv://mehtamanik96:Dmanika2727@cluster0.m5ofsm1.mongodb.net/?retryWrites=true&w=majority";

const app=express();
app.use(express.json());
app.use(createAccount);
app.use(tokenValidator);
app.use(getData);
app.use(verifyOTP);
app.use(sendOTP);

mongoose.connect(Db).then(()=>{console.log('Connected to Database')}).catch((e)=>console.log(e.message));

app.listen(3000,'0.0.0.0', ()=>{
    console.log('Connected!');
})
