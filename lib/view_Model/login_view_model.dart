
import 'package:expance_app/Register_Page.dart';
import 'package:expance_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class LoginViewModel {
  FirebaseAuth _auth = FirebaseAuth.instance;

  void login(BuildContext context, String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _openMainPage(context);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  void openRegisterPage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => RegisterPage(),
      ),
    );
  }

  void _openMainPage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MyApp(),
      ),
    );
  }
}
