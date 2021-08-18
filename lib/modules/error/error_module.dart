import 'package:budget_raro/modules/error/error_controller.dart';
import 'package:budget_raro/modules/error/error_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ErrorModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => ErrorController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => ErrorPage(user: 'user')),
      ];
}
