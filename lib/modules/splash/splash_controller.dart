import 'package:budget_raro/shared/auth/firebase_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'splash_controller.g.dart';

class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  @action
  Future<void> firebaseInitialize() async {
    Modular.get<FirebaseRepository>();
    await FirebaseRepository().firebaseInitialize();
  }

  @action
  Future<void> hasUser() async {
    await Future.delayed(Duration(seconds: 3));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //
    // get user.uid
    //
    // UserModel userLocal = UserModel.fromJson(prefs.get('user').toString());
    // print("${userLocal.uid}");

    if (prefs.containsKey('user')) {
      Modular.to.navigate('/home');
    } else {
      Modular.to.navigate('/login');
    }
  }
}
