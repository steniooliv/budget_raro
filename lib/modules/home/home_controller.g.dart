// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$initialMonthAtom = Atom(name: '_HomeControllerBase.initialMonth');

  @override
  String get initialMonth {
    _$initialMonthAtom.reportRead();
    return super.initialMonth;
  }

  @override
  set initialMonth(String value) {
    _$initialMonthAtom.reportWrite(value, super.initialMonth, () {
      super.initialMonth = value;
    });
  }

  final _$transactionsAtom = Atom(name: '_HomeControllerBase.transactions');

  @override
  List<TransactionModel> get transactions {
    _$transactionsAtom.reportRead();
    return super.transactions;
  }

  @override
  set transactions(List<TransactionModel> value) {
    _$transactionsAtom.reportWrite(value, super.transactions, () {
      super.transactions = value;
    });
  }

  final _$lastTransactionsAtom =
      Atom(name: '_HomeControllerBase.lastTransactions');

  @override
  List<TransactionModel> get lastTransactions {
    _$lastTransactionsAtom.reportRead();
    return super.lastTransactions;
  }

  @override
  set lastTransactions(List<TransactionModel> value) {
    _$lastTransactionsAtom.reportWrite(value, super.lastTransactions, () {
      super.lastTransactions = value;
    });
  }

  final _$lastTransactionsValueAtom =
      Atom(name: '_HomeControllerBase.lastTransactionsValue');

  @override
  num get lastTransactionsValue {
    _$lastTransactionsValueAtom.reportRead();
    return super.lastTransactionsValue;
  }

  @override
  set lastTransactionsValue(num value) {
    _$lastTransactionsValueAtom.reportWrite(value, super.lastTransactionsValue,
        () {
      super.lastTransactionsValue = value;
    });
  }

  final _$userModelAtom = Atom(name: '_HomeControllerBase.userModel');

  @override
  UserModel? get userModel {
    _$userModelAtom.reportRead();
    return super.userModel;
  }

  @override
  set userModel(UserModel? value) {
    _$userModelAtom.reportWrite(value, super.userModel, () {
      super.userModel = value;
    });
  }

  final _$balanceValueAtom = Atom(name: '_HomeControllerBase.balanceValue');

  @override
  num get balanceValue {
    _$balanceValueAtom.reportRead();
    return super.balanceValue;
  }

  @override
  set balanceValue(num value) {
    _$balanceValueAtom.reportWrite(value, super.balanceValue, () {
      super.balanceValue = value;
    });
  }

  final _$monthyValueAtom = Atom(name: '_HomeControllerBase.monthyValue');

  @override
  num get monthyValue {
    _$monthyValueAtom.reportRead();
    return super.monthyValue;
  }

  @override
  set monthyValue(num value) {
    _$monthyValueAtom.reportWrite(value, super.monthyValue, () {
      super.monthyValue = value;
    });
  }

  final _$inValueAtom = Atom(name: '_HomeControllerBase.inValue');

  @override
  num get inValue {
    _$inValueAtom.reportRead();
    return super.inValue;
  }

  @override
  set inValue(num value) {
    _$inValueAtom.reportWrite(value, super.inValue, () {
      super.inValue = value;
    });
  }

  final _$outValueAtom = Atom(name: '_HomeControllerBase.outValue');

  @override
  num get outValue {
    _$outValueAtom.reportRead();
    return super.outValue;
  }

  @override
  set outValue(num value) {
    _$outValueAtom.reportWrite(value, super.outValue, () {
      super.outValue = value;
    });
  }

  final _$getUserAsyncAction = AsyncAction('_HomeControllerBase.getUser');

  @override
  Future<void> getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  final _$getBalanceAsyncAction = AsyncAction('_HomeControllerBase.getBalance');

  @override
  Future<void> getBalance() {
    return _$getBalanceAsyncAction.run(() => super.getBalance());
  }

  final _$getMonthyAsyncAction = AsyncAction('_HomeControllerBase.getMonthy');

  @override
  Future<void> getMonthy(String monthy) {
    return _$getMonthyAsyncAction.run(() => super.getMonthy(monthy));
  }

  final _$getTransactionsAsyncAction =
      AsyncAction('_HomeControllerBase.getTransactions');

  @override
  Future<void> getTransactions(String monthy) {
    return _$getTransactionsAsyncAction
        .run(() => super.getTransactions(monthy));
  }

  final _$getlastTransactionsAsyncAction =
      AsyncAction('_HomeControllerBase.getlastTransactions');

  @override
  Future<void> getlastTransactions() {
    return _$getlastTransactionsAsyncAction
        .run(() => super.getlastTransactions());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  void monthChange(String? month, String? value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.monthChange');
    try {
      return super.monthChange(month, value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void listLastTransactions() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.listLastTransactions');
    try {
      return super.listLastTransactions();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
initialMonth: ${initialMonth},
transactions: ${transactions},
lastTransactions: ${lastTransactions},
lastTransactionsValue: ${lastTransactionsValue},
userModel: ${userModel},
balanceValue: ${balanceValue},
monthyValue: ${monthyValue},
inValue: ${inValue},
outValue: ${outValue}
    ''';
  }
}
