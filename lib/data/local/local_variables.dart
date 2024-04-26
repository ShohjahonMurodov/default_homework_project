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
    imageUrl: "https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?cs=srgb&dl=pexels-italo-melo-881954-2379004.jpg&fm=jpg",
    lastOnlineTime: DateTime.now(),
  ),
  ContactModel(
    contactId: 4,
    contactLasName: "Sharifjon",
    contactName: "Muminov",
    isOnline: false,
    imageUrl: "https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg",
    lastOnlineTime: DateTime.now(),
  ),
];
