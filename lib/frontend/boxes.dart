import 'package:hi/connect/models/confession.dart';
import 'package:hi/connect/models/user_with_chats.dart';
import 'package:hive_flutter/hive_flutter.dart';

late Box<UserWithChats> userDataBox;
late Box<List<ConfessionModel>> sentConfessions;
late Box<List<ConfessionModel>> recievedConfessions;