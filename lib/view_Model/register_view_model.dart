import 'package:expance_app/Login_page.dart';
import 'package:expance_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterViewModel {
  FirebaseAuth _auth = FirebaseAuth.instance;

  void register(BuildContext context, String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _openMainPage(context);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  void openLoginPage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
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
