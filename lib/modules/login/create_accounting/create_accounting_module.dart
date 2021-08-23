import 'package:budget_raro/modules/login/create_accounting/create_accounting_controller.dart';
import 'package:budget_raro/modules/login/create_accounting/create_accounting_page.dart';
import 'package:budget_raro/modules/login/create_accounting/onboarding/onboarding_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CreateAccountingModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => CreateAccountingController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => CreateAccountingPage()),
        ChildRoute('/onboarding', child: (_, args) => OnboardingPage()),
      ];
}
