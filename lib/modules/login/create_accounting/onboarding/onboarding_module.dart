import 'package:budget_raro/modules/login/create_accounting/onboarding/onboarding_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OnboardingModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => OnboardingPage()),
      ];
}
