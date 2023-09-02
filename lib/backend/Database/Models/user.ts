import mongoose, {Schema, model} from 'mongoose';

interface UserModel extends mongoose.Document{
    name: String,
    username: String,
    email: String,
    password: String,
    dob: Date,
    isEmailVerified: Boolean,
    anonymousId: String,
    _doc?: any
}
const userSchema=new Schema<UserModel>({
    name:{
        type: String,
        required: true
    },
    username:{
        type: String,
        required: true
    },
    email:{
        type: String,
        required: true
    },
    password:{
        type: String,
        required: true
    },
    dob:{
        type: Date,
        required: true
    },
    isEmailVerified:{
        type: Boolean,
        required: true
    },
    anonymousId:{
        type: String,
        required: true
    }
});
const User=model('User', userSchema);
export {User};