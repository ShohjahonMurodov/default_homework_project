import 'package:homework/data/models/message_model.dart';

class MessageState {
  MessageState({required this.messages});

  List<MessageModel> messages;

  MessageState copyWith({List<MessageModel>? messages}) {
    return MessageState(messages: messages ?? this.messages);
  }
}
