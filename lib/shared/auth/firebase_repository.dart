import 'package:firebase_core/firebase_core.dart';

enum FirebaseStatus {
  loading,
  success,
  error,
}

class FirebaseRepository {
  late FirebaseStatus firebaseStatus;

  Future<void> firebaseInitialize() async {
    try {
      await Firebase.initializeApp();
      firebaseStatus = FirebaseStatus.success;
      print("INITIALIZE FIREBASE - SUCCESS");
    } catch (e) {
      firebaseStatus = FirebaseStatus.error;
      print("INITIALIZE FIREBASE - ERROR - $e");
    }
  }
}
