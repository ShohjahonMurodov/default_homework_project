import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework/cubit/message_state.dart';
import 'package:homework/data/local/local_variables.dart';
import 'package:homework/data/models/message_model.dart';

class MessageCubit extends Cubit<MessageState> {
  MessageCubit() : super(MessageState(messages: allMessages));

  insertMessages({required MessageModel messageModel}) {
    List<MessageModel> message = state.messages;
    message.add(messageModel);
    emit(state.copyWith(messages: message));
  }

  removeMessages({required MessageModel messageModel}) {
    List<MessageModel> message = state.messages;
    message.remove(messageModel);
    emit(state.copyWith(messages: message));
  }

  sortMessage({required int contactId}) {
    List<MessageModel> message = state.messages.where((element) {
      if (contactId == element.messageId) {
        return true;
      }
      return false;
    }).toList();
    return message;
  }
}
