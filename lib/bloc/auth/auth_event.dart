import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

abstract class AuthEvent {}

class AuthInitialEvent extends AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  AuthLoginEvent({required this.email, required this.password});

  final String email;
  final String password;
}

class AuthRegisterEvent extends AuthEvent {
  AuthRegisterEvent({
    required this.name,
    required this.email,
    required this.password,
    required this.imageUrl,
    required this.isOnline,
    required this.lastSeen,
  });

  final String name;
  final String email;
  final String password;
  final String imageUrl;
  final bool isOnline;
  final Timestamp lastSeen;
}

class AuthGoogleEvent extends AuthEvent {
  AuthGoogleEvent(this.context, [this.clientId]);

  final BuildContext context;
  final String? clientId;
}
