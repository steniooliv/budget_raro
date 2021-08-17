import 'package:budget_raro/modules/splash/splash_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidgetModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: SplashModule()),
      ];
}
