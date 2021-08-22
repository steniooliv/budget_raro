import 'package:budget_raro/modules/home/home_controller.dart';
import 'package:budget_raro/modules/home/home_page.dart';
import 'package:budget_raro/modules/home/home_repository.dart';
import 'package:budget_raro/modules/home/profile/profile_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => HomeController(repository: HomeRepository())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => HomePage()),
        ModuleRoute('/profile', module: ProfileModule()),
      ];
}
