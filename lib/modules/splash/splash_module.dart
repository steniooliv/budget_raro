import 'package:budget_raro/modules/splash/splash_controller.dart';
import 'package:budget_raro/modules/splash/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => SplashController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => SplashPage()),
      ];
}
