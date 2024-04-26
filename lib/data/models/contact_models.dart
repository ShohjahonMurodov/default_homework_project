class ContactModel {
  final int contactId;
  final String contactName;
  final String contactLasName;
  final bool isOnline;
  final String imageUrl;
  final DateTime lastOnlineTime;

  ContactModel({
    required this.contactId,
    required this.contactLasName,
    required this.contactName,
    required this.isOnline,
    required this.imageUrl,
    required this.lastOnlineTime,
  });
}

// ContactModel SOLID ning 1-siga (S) yani, Single Responsibility ga togri keladi.
// Chunki har bir klass yoki funksiya faqatgina bitta vazifani bajarishi kerak.