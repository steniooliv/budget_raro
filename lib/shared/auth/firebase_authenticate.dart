import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:budget_raro/shared/auth/firebase_repository.dart';
import 'package:budget_raro/shared/models/user_model.dart';

class FirebaseAuthenticate {
  final FirebaseRepository firebaseRepository;

  FirebaseAuthenticate({
    required this.firebaseRepository,
  });
}
