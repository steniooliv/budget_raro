import 'package:budget_raro/shared/models/user_model.dart';
import 'package:mobx/mobx.dart';

import 'package:budget_raro/modules/home/home_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final HomeRepository repository;

  _HomeControllerBase({
    required this.repository,
  });

  @observable
  UserModel? userModel;

  @action
  Future<void> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    UserModel _userModel = UserModel.fromJson(prefs.get('user').toString());
    userModel = _userModel;
  }
}
