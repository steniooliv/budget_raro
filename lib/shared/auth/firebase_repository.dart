import 'package:budget_raro/shared/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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
    print("${instance.getString('user')}");
    return;
  }

  Future<void> createAccounting({
    required String name,
    required String email,
    required String cpf,
    required String phone,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      final _uid = userCredential.user!.uid;
      final _email = userCredential.user!.email!;
      final _name = name;
      final _cpf = cpf;
      final _phone = phone;
      await firebaseFirestore.collection('users').doc('$_uid').set({
        'name': _name,
        'email': _email,
        'cpf': _cpf,
        'phone': _phone,
        'created_at': FieldValue.serverTimestamp(),
      });

      final user = UserModel(
          email: _email, uid: _uid, cpf: _cpf, name: _name, phone: _phone);
      saveUser(user);
    } on FirebaseException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('This e-mail already exist in other user accouting.');
      }
    }
  }
}
