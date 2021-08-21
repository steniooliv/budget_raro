import 'package:budget_raro/shared/auth/firebase_repository.dart';

class FirebaseAuthenticate {
  final FirebaseRepository firebaseRepository;

  FirebaseAuthenticate({
    required this.firebaseRepository,
  });

  Future<void> login() async {
    //TODO: CHAMAR O FIREBASE AUTH, PASSAR O EMAIL E SENHA
    //RETORNAR O USUÁRIO E CHAMAR A FUNÇÃO DE SALVAR USUÁRIO NO SHARED PREFERENCES
    //firebaseRepository.saveUser(user)
    //MANDO O USUÁRIO PRA HOMEPAGE
  }
}
