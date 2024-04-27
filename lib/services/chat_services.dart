import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:homework/data/models/message_model.dart';

class ChatServices extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> sentMessage(
      {required String recieverId, required String message}) async {
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();

    MessageModel messageModel = MessageModel(
      message: message,
      senderId: currentUserId,
      senderEmail: currentUserEmail,
      receiverId: recieverId,
      timestamp: timestamp,
    );
    List<String> ids = [currentUserId, recieverId];
    ids.sort();
    String chatRoomId = ids.join("^");

    await _firebaseFirestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(
          messageModel.toJson(),
        );
  }

  Stream<QuerySnapshot> getMessages(String userId, String otherUserId) {
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join("^");
    return _firebaseFirestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy(
          "timestamp",
          descending: false,
        )
        .snapshots();
  }
}
