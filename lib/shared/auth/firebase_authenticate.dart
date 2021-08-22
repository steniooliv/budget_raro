import 'package:budget_raro/shared/auth/firebase_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthenticate {
  final FirebaseRepository firebaseRepository;

  FirebaseAuthenticate({
    required this.firebaseRepository,
  });

  Future<void> login({
    required String email,
    required String password,
  }) async{
    try{
    firebaseRepository.firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return firebaseRepository.saveUser(firebaseRepository.user);
    }
    on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}

