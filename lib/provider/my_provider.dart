import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/models/user_model.dart';
import 'package:todo_app/helper/firebase_functions.dart';

class MyProvider extends ChangeNotifier {
  late User? firebaseUser;
  UserModel? userModel;

  MyProvider() {
    firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      // معناها ان اليوز كدا عامل لوجين
      initUser();
    }
  }
  initUser() async {
    userModel = await FireBaseFunctions.readUser();
    notifyListeners();
  }
}
