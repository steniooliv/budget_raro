import 'package:budget_raro/modules/home/widgets/daily-balance-card-widget.dart';
import 'package:budget_raro/modules/home/widgets/general-balance-card-widget.dart';
import 'package:budget_raro/modules/home/widgets/last_transactions_card_widget.dart';
import 'package:budget_raro/shared/models/transaction_model.dart';
import 'package:budget_raro/shared/widgets/custom_app_bar/custom_app_bar_widget.dart';
import 'package:budget_raro/shared/widgets/drawer/drawer_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  final List<TransactionModel> transactions = <TransactionModel>[
    TransactionModel(
        value: -50.0, tag: 'REFEICAO', type: 'out', date: DateTime.now()),
    TransactionModel(
        value: 30.0, tag: 'TRANSPORTE', type: 'out', date: DateTime.now()),
    TransactionModel(
        value: -100.0, tag: 'Pagamentos', type: 'out', date: DateTime.now()),
    TransactionModel(
        value: 900.0, tag: 'TED', type: 'in', date: DateTime.now()),
  ];

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Budget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        key: _key,
        drawer: DrawerWidget(),
        appBar: CustomAppBarWidget(
          drawerKey: _key,
          welcome: 'Olá, José',
        ),
        // appBar: CustomAppBarWidget(drawerKey: ,),
        body: SingleChildScrollView(
          child: Column(
            children: [
              GeneralBalanceCard(),
              DailyBalanceCard(),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: LastTransactionsCard(
                    lastTransactions: widget.transactions, subtotal: 2000.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
