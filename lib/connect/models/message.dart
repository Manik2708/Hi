class Message{
  String senderId;
  String recieverId;
  String message;
  DateTime timeOfMessage;
  Message({
    required this.senderId,
    required this.recieverId,
    required this.message,
    required this.timeOfMessage
});
}