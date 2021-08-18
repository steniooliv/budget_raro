import 'package:budget_raro/modules/home/profile/profile_controller.dart';
import 'package:budget_raro/modules/home/profile/profile_page.dart';
import 'package:budget_raro/modules/home/profile/profile_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfileModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => ProfileController(repository: ProfileRepository())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => ProfilePage()),
      ];
}
