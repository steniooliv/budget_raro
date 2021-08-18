import 'package:budget_raro/modules/login/create_accounting/create_accounting_page.dart';
import 'package:budget_raro/modules/login/create_accounting/create_accouting_controller.dart';
import 'package:budget_raro/modules/login/create_accounting/create_accouting_repository.dart';
import 'package:budget_raro/modules/login/create_accounting/onboarding/onboarding_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CreateAccountingModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => CreateAccountingController(
            repository: CreateAccountingRepository())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => CreateAccountingPage()),
        ChildRoute('/onboarding', child: (_, __) => OnboardingPage()),
      ];
}
