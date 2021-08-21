import 'package:budget_raro/shared/auth/firebase_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'create_accounting_controller.g.dart';

class CreateAccountingController = _CreateAccountingControllerBase
    with _$CreateAccountingController;

abstract class _CreateAccountingControllerBase with Store {
  final TextEditingController name = TextEditingController();
  final TextEditingController cpf = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  FirebaseRepository firebaseRepository = FirebaseRepository();

  @observable
  int aux = 1;

  @observable
  bool isChecked = false;

  @action
  void nextPage({required PageController pageController}) {
    if (pageController.hasClients &&
        pageController.page != 3 &&
        pageController.page != 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
      );

      aux++;
    }
    if (pageController.hasClients &&
        pageController.page == 2 &&
        isChecked == true) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
      );
      aux++;
    }
    if (pageController.page == 3) {
      firebaseRepository
          .createAccounting(
        name: name.text,
        email: email.text,
        phone: phone.text,
        cpf: cpf.text,
        password: password.text,
      )
          .then(
        (value) {
          pageController.jumpToPage(0);
          aux = 1;
          Modular.to
              .pushReplacementNamed('/login/create_accounting/onboarding');
        },
      );
    }
  }

  @action
  void prevPage({required PageController pageController}) {
    if (pageController.hasClients && pageController.page != 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
      );
      aux--;
    }
    if (pageController.page == 0) {
      Modular.to.pop();
      aux = 1;
    }
  }
}
