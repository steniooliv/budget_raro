import 'package:budget_raro/shared/auth/firebase_repository.dart';
import 'package:budget_raro/shared/models/transaction_model.dart';
import 'package:budget_raro/shared/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

import 'package:budget_raro/modules/home/home_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final HomeRepository repository;

  FirebaseRepository firebaseRepository = FirebaseRepository();

  _HomeControllerBase({
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
  List<TransactionModel> transactions = [];

  @observable
  List<TransactionModel> lastTransactions = [];

  @observable
  num lastTransactionsValue = 0;

  @observable
  UserModel? userModel;

  @observable
  num balanceValue = 0;

  @observable
  num monthyValue = 0;

  @observable
  num inValue = 0;

  @observable
  num outValue = 0;

  @action
  void monthChange(String? month, String? value) {
    month = value;
    print(month);
  }

  @action
  Future<void> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    UserModel _userModel = UserModel.fromJson(prefs.get('user').toString());
    userModel = _userModel;
  }

  @action
  Future<void> getBalance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    UserModel _userModel = UserModel.fromJson(prefs.get('user').toString());
    balanceValue = 0;
    await firebaseRepository.firebaseFirestore
        .collection('users')
        .doc(_userModel.uid)
        .collection('balance')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        balanceValue += doc["value"];
      });
    });
  }

  @action
  Future<void> getMonthy(String monthy) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    UserModel _userModel = UserModel.fromJson(prefs.get('user').toString());
    monthyValue = 0;
    inValue = 0;
    outValue = 0;
    final response = await firebaseRepository.firebaseFirestore
        .collection('users')
        .doc(_userModel.uid)
        .collection('monthy')
        .doc(monthy)
        .get();
    final data = response.data();
  }

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
    transactions = data;
  }

  @action
  Future<void> getlastTransactions() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    UserModel _userModel = UserModel.fromJson(prefs.get('user').toString());
    final monthNumber = DateTime.now().month;
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

    transactions = data;
  }

  @action
  void listLastTransactions() {
    getlastTransactions();
    lastTransactionsValue = 0;
    lastTransactions = transactions;
    if (lastTransactions.length > 2) {
      lastTransactions.removeRange(3, lastTransactions.length);
    }
    lastTransactions.map((e) => lastTransactionsValue += e.value).toList();
  }
}
