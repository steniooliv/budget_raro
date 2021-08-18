import 'package:budget_raro/modules/transactions/create_transaction/create_transaction_controller.dart';
import 'package:budget_raro/modules/transactions/create_transaction/create_transaction_page.dart';
import 'package:budget_raro/modules/transactions/create_transaction/create_transaction_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CreateTransactionModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => CreateTransactionController(
            repository: CreateTransactionRepository())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (_, args) => CreateTransactionPage(
                  type: args.toString(),
                )),
      ];
}
