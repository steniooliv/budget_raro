import 'package:budget_raro/modules/transactions/edit_transaction/edit_transaction_controller.dart';
import 'package:budget_raro/modules/transactions/edit_transaction/edit_transaction_page.dart';
import 'package:budget_raro/modules/transactions/edit_transaction/edit_transaction_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EditTransactionModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) =>
            EditTransactionController(repository: EditTransactionRepository())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (_, args) => EditTransactionPage(
                type: args.data,
                value: args.data,
                title: args.data,
                date: args.data)),
      ];
}
