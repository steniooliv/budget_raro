import 'package:budget_raro/shared/auth/firebase_repository.dart';
import 'package:budget_raro/shared/models/transaction_model.dart';
import 'package:budget_raro/shared/models/transaction_types_model.dart';
import 'package:budget_raro/shared/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:budget_raro/modules/transactions/create_transaction/create_transaction_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'create_transaction_controller.g.dart';

class CreateTransactionController = _CreateTransactionControllerBase
    with _$CreateTransactionController;

abstract class _CreateTransactionControllerBase with Store {
  final CreateTransactionRepository repository;
  _CreateTransactionControllerBase({
    required this.repository,
  });

  FirebaseRepository firebaseRepository = FirebaseRepository();

  TextEditingController descriptionController = TextEditingController();
  TextEditingController valueController = TextEditingController();

  String type = 'in';

  List<String> inCategory = ['pix', 'money', 'invoice', 'payment', 'payment'];

  @observable
  TransactionTypesModel item =
      TransactionTypesModel(icon: '', tag: '', category: '');

  @observable
  TransactionTypesModel transactionSelected =
      TransactionTypesModel(icon: '', tag: '', category: '');

  @observable
  DateTime date = DateTime.now();

  @action
  Future<void> saveTransaction() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    UserModel _userModel = UserModel.fromJson(prefs.get('user').toString());
    try {
      firebaseRepository.firebaseFirestore
          .collection('users')
          .doc(_userModel.uid)
          .collection('transactions')
          .add({
        'category': item.category,
        'type': 'in',
        'description': descriptionController.text,
        'value': int.parse(valueController.text),
        'createdAt': date,
      });
    } catch (e) {
      print(e);
    }
  }
}
