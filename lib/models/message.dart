import 'package:chat_app/constants.dart';

class MessageModel {
  final String textMassage;
  final String id;

  MessageModel(this.textMassage, this.id);

  factory MessageModel.formJson(jsonData) {
    return MessageModel(jsonData[kMessage],jsonData['id']);
  }
}
