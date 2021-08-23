import 'package:budget_raro/shared/auth/firebase_repository.dart';
import 'package:budget_raro/shared/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'package:budget_raro/modules/home/profile/profile_repository.dart';

part 'profile_controller.g.dart';

class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store {
  final ProfileRepository repository;

  FirebaseRepository firebaseRepository = FirebaseRepository();

  _ProfileControllerBase({
    required this.repository,
  });

  TextEditingController nameController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @observable
  UserModel? userModel;

  @action
  void populateController(UserModel user) {
    nameController.text = user.name!;
    cpfController.text = user.cpf!;
    emailController.text = user.email;
    phoneController.text = user.phone!;
  }

  @action
  changeModel(value) => userModel = value;

  @action
  Future<void> updateUser({required String name, required String phone}) async {
    try {
      firebaseRepository.firebaseFirestore
          .collection('users')
          .doc(userModel!.uid)
          .update({
        "name": name,
        "phone": phone,
      }).then(
        (value) => {
          print("User data has been modifier."),
          Modular.to.pop(),
        },
      );
    } catch (e) {
      print("error: $e");
    }
  }
}
