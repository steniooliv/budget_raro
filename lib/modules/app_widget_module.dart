import 'package:budget_raro/modules/error/error_module.dart';
import 'package:budget_raro/modules/home/home_module.dart';
import 'package:budget_raro/modules/login/login_module.dart';
import 'package:budget_raro/modules/splash/splash_module.dart';
import 'package:budget_raro/modules/transactions/transactions_module.dart';
import 'package:budget_raro/shared/auth/firebase_authenticate.dart';
import 'package:budget_raro/shared/auth/firebase_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidgetModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => FirebaseRepository()),
        Bind.singleton((i) => FirebaseAuthenticate(
            firebaseRepository: i.get<FirebaseRepository>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: SplashModule()),
        ModuleRoute('/login', module: LoginModule()),
        ModuleRoute('/home', module: HomeModule()),
        ModuleRoute('/transactions', module: TransactionsModule()),
        ModuleRoute('/error', module: ErrorModule()),
      ];
}
