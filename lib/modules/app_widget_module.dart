import 'package:budget_raro/modules/app_widget_controller.dart';
import 'package:budget_raro/modules/error/error_module.dart';
import 'package:budget_raro/modules/home/home_module.dart';
import 'package:budget_raro/modules/login/login_module.dart';
import 'package:budget_raro/modules/splash/splash_module.dart';
import 'package:budget_raro/modules/transactions/transactions_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidgetModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => AppWidgetController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: SplashModule()),
        ModuleRoute('/home', module: HomeModule()),
        ModuleRoute('/login', module: LoginModule()),
        ModuleRoute('/transactions', module: TransactionsModule()),
        ModuleRoute('/error', module: ErrorModule()),
      ];
}
