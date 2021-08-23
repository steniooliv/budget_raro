import 'package:budget_raro/modules/transactions/transactions_repository.dart';
import 'package:budget_raro/shared/auth/firebase_repository.dart';
import 'package:budget_raro/shared/models/transaction_model.dart';
import 'package:budget_raro/shared/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'transactions_controller.g.dart';

class TransactionsController = _TransactionsControllerBase
    with _$TransactionsController;

abstract class _TransactionsControllerBase with Store {
  final TransactionsRepository repository;
  FirebaseRepository firebaseRepository = FirebaseRepository();

  _TransactionsControllerBase({
    required this.repository,
  });

  List<String> months = [
    "JAN",
    "FEV",
    "MAR",
    "ABR",
    "MAI",
    "JUN",
    "JUL",
    "AGO",
    "SET",
    "OUT",
    "NOV",
    "DEZ"
  ];

  @observable
  late String initialMonth = months[DateTime.now().month - 1];

  @observable
  List<TransactionModel> inTransactions = [];

  @observable
  List<TransactionModel> outTransactions = [];

  @observable
  List<TransactionModel> allTransactions = [];

  @observable
  num monthyValue = 0;

  @observable
  num inValue = 0;

  @observable
  num outValue = 0;

  @action
  Future<void> getTransactions(String monthy) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    UserModel _userModel = UserModel.fromJson(prefs.get('user').toString());
    monthyValue = 0;
    inValue = 0;
    outValue = 0;
    final monthNumber = months.indexOf(monthy) + 1;
    final response = await firebaseRepository.firebaseFirestore
        .collection('users')
        .doc(_userModel.uid)
        .collection('transactions')
        .where('createdAt',
            isGreaterThanOrEqualTo: DateTime(2021, monthNumber, 1),
            isLessThanOrEqualTo: DateTime(2021, monthNumber, 32))
        .orderBy('createdAt', descending: true)
        .get();
    List<TransactionModel> data = response.docs
        .map((e) => TransactionModel.fromMapFirebase(e.data()))
        .toList();
    data
        .map((e) => {
              if (e.type == 'in')
                {inValue = inValue + e.value}
              else if (e.type == 'out')
                {outValue = outValue + e.value}
            })
        .toList();
    monthyValue = inValue - outValue;
    allTransactions = data;
    inTransactions.clear();
    data.map((e) {
      if (e.type == 'in') {
        inTransactions.add(e);
      }
    }).toList();
    outTransactions.clear();
    data.map((e) {
      if (e.type == 'out') {
        outTransactions.add(e);
      }
    }).toList();
    print(inTransactions);
    print(outTransactions);
  }
}
