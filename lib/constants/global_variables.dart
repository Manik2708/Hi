import 'package:intl/intl.dart';
const String imageFolder='lib/assets/images/';
const String iconFolder='lib/assets/icons/';
String uri='http://192.168.0.103:3000';
final dateFormatter = DateFormat('dd-MM-yyyy');
final timeFormatter = DateFormat('HH:mm:ss');
class EventNames{
  static const String userOnline='UserOnline';
  static const String socketId='socketId';
  static const String searchUser='searchUser';
  static const String searchedUser='searchedUser';
  static const String noToken='noToken';
  static const String invalidToken='invalidToken';
  static const String userNotFound='userNotFound';
  static const String emptySearchBar='emptySearchBar';
  static const String sendConfession='send-confession';
  static const String recieveConfession='recieve-sonfession';
  static const String updateFirebaseConfession='update-Firebase-Confession';
  static const String tokenLost='token-lost';
  static const String recieveAllMessages='recieve-all-messages';
  static const String appIsClosed='app-is-closed';
}
class UserModelJsonController{
  static const String name='name';
  static const String email='email';
  static const String anonymousId='anonymousId';
  static const String username='username';
  static const String password='password';
  static const String dob='dob';
  static const String isEmailVerified='isEmailVerified';
  static const String token='token';
  static const String id='_id';
  static const String sentConfessionList='sentConfessionsList';
  static const String recievedConfessionList='recievedConfessionsList';
}

