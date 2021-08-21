// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_accounting_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateAccountingController on _CreateAccountingControllerBase, Store {
  final _$auxAtom = Atom(name: '_CreateAccountingControllerBase.aux');

  @override
  int get aux {
    _$auxAtom.reportRead();
    return super.aux;
  }

  @override
  set aux(int value) {
    _$auxAtom.reportWrite(value, super.aux, () {
      super.aux = value;
    });
  }

  final _$isCheckedAtom =
      Atom(name: '_CreateAccountingControllerBase.isChecked');

  @override
  bool get isChecked {
    _$isCheckedAtom.reportRead();
    return super.isChecked;
  }

  @override
  set isChecked(bool value) {
    _$isCheckedAtom.reportWrite(value, super.isChecked, () {
      super.isChecked = value;
    });
  }

  final _$_CreateAccountingControllerBaseActionController =
      ActionController(name: '_CreateAccountingControllerBase');

  @override
  void nextPage({dynamic pageController}) {
    final _$actionInfo = _$_CreateAccountingControllerBaseActionController
        .startAction(name: '_CreateAccountingControllerBase.nextPage');
    try {
      return super.nextPage(pageController: pageController);
    } finally {
      _$_CreateAccountingControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void prevPage({dynamic pageController}) {
    final _$actionInfo = _$_CreateAccountingControllerBaseActionController
        .startAction(name: '_CreateAccountingControllerBase.prevPage');
    try {
      return super.prevPage(pageController: pageController);
    } finally {
      _$_CreateAccountingControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
aux: ${aux},
isChecked: ${isChecked}
    ''';
  }
}
