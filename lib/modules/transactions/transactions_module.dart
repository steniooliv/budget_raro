import 'package:budget_raro/modules/transactions/create_transaction/create_transaction_page.dart';
import 'package:budget_raro/modules/transactions/edit_transaction/edit_transaction_page.dart';
import 'package:budget_raro/modules/transactions/transactions_controller.dart';
import 'package:budget_raro/modules/transactions/transactions_page.dart';
import 'package:budget_raro/modules/transactions/transactions_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TransactionsModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) =>
            TransactionsController(repository: TransactionsRepository())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => TransactionsPage()),
        ChildRoute('/create',
            child: (_, args) => CreateTransactionPage(type: args.data)),
        ChildRoute('/edit',
            child: (_, args) => EditTransactionPage(
                type: args.data,
                value: args.data,
                title: args.data,
                date: args.data)),
      ];
}
