import 'package:budget_raro/shared/models/transaction_model.dart';
import 'package:budget_raro/shared/widgets/button_widget/button_widget.dart';
import 'package:budget_raro/shared/widgets/custom_app_bar/custom_app_bar_balance_widget.dart';
import 'package:budget_raro/shared/widgets/transactions_card/transactions_card_widget.dart';
import 'package:flutter/material.dart';

class TransactionsPage extends StatefulWidget {
  TransactionsPage({Key? key}) : super(key: key);

  @override
  _TransactionsPageState createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  
  final PageController controller = PageController(initialPage: 0);
  final List<TransactionModel> transactionTest = [];
  String valor = "0,00";
  double total = 0;

  void toCreatePage() {
    Navigator.pushNamed(context, '/create');
  }

  @override
  Widget build(BuildContext context) { 
    GlobalKey<ScaffoldState> _key = GlobalKey();
    return Scaffold(
      appBar: CustomAppBarBalanceWidget(
        dropdownDefault: "AGOSTO",
        pageController: controller,
        balance: valor,
        drawerKey: _key,
      ), 
      body: PageView(
        controller: controller,
        children: [   
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 40),
                child: TransactionsCard(
                  transactions: transactionTest, 
                  total: total,
                  transactionType: "entradas",
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: CustomButton.add(onTap: toCreatePage),
                )
              )
            ] 
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 40),
                child: TransactionsCard(
                  transactions: transactionTest, 
                  total: total,
                  transactionType: "sáidas",
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: CustomButton.add(onTap: toCreatePage),
                )
              )
            ] 
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 40),
            child: TransactionsCard(
              transactions: transactionTest, 
              total: total,
            ),
          ),
        ],
      ),
    );
  }
}