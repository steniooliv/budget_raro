import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

part 'firebase_controller.g.dart';

class FirebaseController = _FirebaseControllerBase with _$FirebaseController;

abstract class _FirebaseControllerBase with Store {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  User? user;
}
