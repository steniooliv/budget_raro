import 'dart:io';

import 'package:budget_raro/shared/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum FirebaseStatus {
  loading,
  success,
  error,
}

class FirebaseRepository {
  late FirebaseStatus firebaseStatus;
  late FirebaseAuth firebaseAuth;
  late FirebaseFirestore firebaseFirestore;

  Future<void> firebaseInitialize() async {
    try {
      await Firebase.initializeApp();
      firebaseStatus = FirebaseStatus.success;
      firebaseAuth = FirebaseAuth.instance;
      firebaseFirestore = FirebaseFirestore.instance;
      print("INITIALIZE FIREBASE - SUCCESS");
    } catch (e) {
      firebaseStatus = FirebaseStatus.error;
      print("INITIALIZE FIREBASE - ERROR - $e");
    }
  }

  UserModel? _user;
  UserModel get user => _user!;

  Future<void> saveUser(UserModel user) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString('user', user.toJson());
    return;
  }

  Future<void> createAccounting({email, password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      final _uid = userCredential.user!.uid;
      final _email = userCredential.user!.email!;
      await firebaseFirestore.collection('users').doc('$_uid').set({
        'email': _email,
      });
      final user = UserModel(email: _email, uid: _uid);
      saveUser(user);
    } catch (e) {
      print(e);
    }
  }
}
