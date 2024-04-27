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
  });

  final String name;
  final String email;
  final String password;
}

class AuthGoogleEvent extends AuthEvent {
  AuthGoogleEvent(this.context, [this.clientId]);

  final BuildContext context;
  final String? clientId;
}
