import 'package:budget_raro/shared/auth/firebase_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'splash_controller.g.dart';

class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  late final FirebaseRepository firebaseRepository = FirebaseRepository();

  Future<void> hasUser() async {
    await Future.delayed(Duration(seconds: 3));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('user_uid')) {
      Modular.to.pushReplacementNamed('/home');
    } else {
      Modular.to.pushReplacementNamed('/login');
    }
  }
}
