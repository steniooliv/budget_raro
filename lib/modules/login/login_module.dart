import 'package:budget_raro/modules/login/create_accounting/create_accounting_page.dart';
import 'package:budget_raro/modules/login/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => LoginPage()),
        ChildRoute('/create_accounting',
            child: (_, __) => CreateAccountingPage()),
      ];
}
