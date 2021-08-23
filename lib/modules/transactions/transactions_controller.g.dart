// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransactionsController on _TransactionsControllerBase, Store {
  final _$initialMonthAtom =
      Atom(name: '_TransactionsControllerBase.initialMonth');

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

  final _$inTransactionsAtom =
      Atom(name: '_TransactionsControllerBase.inTransactions');

  @override
  List<TransactionModel> get inTransactions {
    _$inTransactionsAtom.reportRead();
    return super.inTransactions;
  }

  @override
  set inTransactions(List<TransactionModel> value) {
    _$inTransactionsAtom.reportWrite(value, super.inTransactions, () {
      super.inTransactions = value;
    });
  }

  final _$outTransactionsAtom =
      Atom(name: '_TransactionsControllerBase.outTransactions');

  @override
  List<TransactionModel> get outTransactions {
    _$outTransactionsAtom.reportRead();
    return super.outTransactions;
  }

  @override
  set outTransactions(List<TransactionModel> value) {
    _$outTransactionsAtom.reportWrite(value, super.outTransactions, () {
      super.outTransactions = value;
    });
  }

  final _$allTransactionsAtom =
      Atom(name: '_TransactionsControllerBase.allTransactions');

  @override
  List<TransactionModel> get allTransactions {
    _$allTransactionsAtom.reportRead();
    return super.allTransactions;
  }

  @override
  set allTransactions(List<TransactionModel> value) {
    _$allTransactionsAtom.reportWrite(value, super.allTransactions, () {
      super.allTransactions = value;
    });
  }

  final _$monthyValueAtom =
      Atom(name: '_TransactionsControllerBase.monthyValue');

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

  final _$inValueAtom = Atom(name: '_TransactionsControllerBase.inValue');

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

  final _$outValueAtom = Atom(name: '_TransactionsControllerBase.outValue');

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

  final _$getTransactionsAsyncAction =
      AsyncAction('_TransactionsControllerBase.getTransactions');

  @override
  Future<void> getTransactions(String monthy) {
    return _$getTransactionsAsyncAction
        .run(() => super.getTransactions(monthy));
  }

  @override
  String toString() {
    return '''
initialMonth: ${initialMonth},
inTransactions: ${inTransactions},
outTransactions: ${outTransactions},
allTransactions: ${allTransactions},
monthyValue: ${monthyValue},
inValue: ${inValue},
outValue: ${outValue}
    ''';
  }
}
