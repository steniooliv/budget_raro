import 'package:budget_raro/shared/auth/firebase_authenticate.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:budget_raro/shared/auth/firebase_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
part 'login_controller.g.dart';


class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  
  FirebaseRepository firebaseRepository = FirebaseRepository();

  @observable
  bool enable = false;

  @observable
  void isActive(){
    if (email.text.isEmpty){
      enable = false;
    }
    else{
      enable = true;
    }
  }
  

  @action
  Future<void> firebaseInitialize() async {
    Modular.get<FirebaseRepository>();
    await FirebaseRepository().firebaseInitialize();
  }
  
  @observable
  PageController pageController =PageController(initialPage: 0);

  @observable
  final formKey = GlobalKey<FormState>();
  
  @action
  nextPage() {
    if (pageController.hasClients && formKey.currentState!.validate()) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
      );
    }
  }
  @action
  prevPage() {
    if (pageController.hasClients && formKey.currentState!.validate()) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
      );
    }
  }
  @action
  ontapAux() {}

  @action
  toRegisterPage() {
    Modular.to.pushNamed('/login/create_accounting');
  }

  @action
  toHomePage() {
    FirebaseAuthenticate firebaseAuthenticate = FirebaseAuthenticate(firebaseRepository: firebaseRepository);
    if (formKey.currentState!.validate())  {
      firebaseAuthenticate
      .login(
        email: email.text,
        password: password.text,
      ).then(
        (value) {
          pageController.jumpToPage(0);
          Modular.to.navigate('/home');
        },
      );
    }
  }
  
}
