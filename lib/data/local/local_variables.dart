import '../models/contact_models.dart';
import '../models/message_model.dart';

List<MessageModel> allMessages = [
  MessageModel(
    createdTime: "2024-03-25 20:41:11.366752",
    messageText: "Vazifa nima bo'ldi alisher?",
    messageId: 1,
    isFile: false,
    contactId: 3,
    status: true,
  ),
  MessageModel(
    createdTime: "2024-04-20 20:41:11.366752",
    messageText: "https://bilimlar.uz/wp-content/uploads/2021/02/k100001.pdf",
    messageId: 1,
    isFile: true,
    contactId: 3,
    status: true,
  ),
];

List<ContactModel> allContacts = [
  ContactModel(
    contactId: 3,
    contactLasName: "Alisher",
    contactName: "Falonchiyev",
    isOnline: true,
    imageUrl: "",
    lastOnlineTime: DateTime.now(),
  )
];
