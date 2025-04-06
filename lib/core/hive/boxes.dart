import 'package:attendance_app/core/constants/constants.dart';
import 'package:attendance_app/core/hive/chat_history.dart';
import 'package:attendance_app/core/hive/settings.dart';
import 'package:attendance_app/core/hive/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Boxes {
  static Box<ChatHistory> getChatHistory() =>
      Hive.box<ChatHistory>(Constants.chatHistoryBox);
  static Box<UserModel> getUserModel() =>
      Hive.box<UserModel>(Constants.userModelBox);
  static Box<Settings> getSettings() =>
      Hive.box<Settings>(Constants.settingsBox);
}
