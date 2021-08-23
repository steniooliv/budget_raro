// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  final _$enableAtom = Atom(name: '_LoginControllerBase.enable');

  @override
  bool get enable {
    _$enableAtom.reportRead();
    return super.enable;
  }

  @override
  set enable(bool value) {
    _$enableAtom.reportWrite(value, super.enable, () {
      super.enable = value;
    });
  }

  final _$pageControllerAtom =
      Atom(name: '_LoginControllerBase.pageController');

  @override
  PageController get pageController {
    _$pageControllerAtom.reportRead();
    return super.pageController;
  }

  @override
  set pageController(PageController value) {
    _$pageControllerAtom.reportWrite(value, super.pageController, () {
      super.pageController = value;
    });
  }

  final _$firebaseInitializeAsyncAction =
      AsyncAction('_LoginControllerBase.firebaseInitialize');

  @override
  Future<void> firebaseInitialize() {
    return _$firebaseInitializeAsyncAction
        .run(() => super.firebaseInitialize());
  }

  final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase');

  @override
  void isActive() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.isActive');
    try {
      return super.isActive();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic nextPage() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.nextPage');
    try {
      return super.nextPage();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic prevPage() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.prevPage');
    try {
      return super.prevPage();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic ontapAux() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.ontapAux');
    try {
      return super.ontapAux();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic toRegisterPage() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.toRegisterPage');
    try {
      return super.toRegisterPage();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic toHomePage() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.toHomePage');
    try {
      return super.toHomePage();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
enable: ${enable},
pageController: ${pageController}
    ''';
  }
}
