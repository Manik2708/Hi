interface OnlineUser{
    userId: String,
    socketId: String
}

const OnlineUsers=new Map<OnlineUser['userId'], OnlineUser['socketId']>

export {OnlineUsers};