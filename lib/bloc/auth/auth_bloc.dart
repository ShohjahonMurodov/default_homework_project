import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:homework/bloc/auth/auth_event.dart';
import 'package:homework/bloc/auth/auth_state.dart';
import 'package:homework/screens/contacts/contact_screen.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    on<AuthLoginEvent>(_login);
    on<AuthRegisterEvent>(_register);
    on<AuthInitialEvent>(_initialState);
  }

  User? getUser = FirebaseAuth.instance.currentUser;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<void> _login(AuthLoginEvent event, emit) async {
    emit(AuthLoadingState());
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      _fireStore.collection('users').doc(userCredential.user!.uid).set(
        {
          "uuid": userCredential.user!.uid,
          "email": event.email,
        },
        SetOptions(
          merge: true,
        ),
      );
      emit(AuthSuccessState());
    } catch (e) {
      emit(AuthErrorState(errorText: e.toString()));
    }
  }

  Future<void> _register(AuthRegisterEvent event, emit) async {
    emit(AuthLoadingState());
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      await FirebaseAuth.instance.currentUser!.updateDisplayName(event.name);
      _fireStore.collection('users').doc(userCredential.user!.uid).set({
        "uuid": userCredential.user!.uid,
        "email": event.email,
        'name': event.name,
        'image_url': event.imageUrl,
      });
      emit(AuthSuccessState());
    } catch (e) {
      emit(AuthErrorState(errorText: e.toString()));
    }
  }

  _initialState(AuthInitialEvent event, emit) {
    emit(AuthInitialState());
  }

  Future<void> signInWithGoogle(AuthGoogleEvent event, emit) async {
    emit(AuthLoadingState());

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    emit(AuthSuccessState());
    if (userCredential.user != null) {
      Navigator.pushReplacement(
        event.context,
        MaterialPageRoute(
          builder: (context) => const ContactScreen(),
        ),
      );
    }
  }
}
