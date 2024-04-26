class MessageModel {
  final int messageId;
  final String messageText;
  final bool isFile;
  final String createdTime;
  final int contactId;
  final bool status;

  MessageModel({
    required this.createdTime,
    required this.messageText,
    required this.messageId,
    required this.isFile,
    required this.contactId,
    required this.status,
  });
}

// MessageModel SOLID ning 1-siga (S) yani, Single Responsibility ga togri keladi.
// Chunki har bir klass yoki funksiya faqatgina bitta vazifani bajarishi kerak.