import 'package:budget_raro/modules/transactions/transactions_controller.dart';
import 'package:budget_raro/shared/models/transaction_model.dart';
import 'package:budget_raro/shared/themes/app_colors.dart';
import 'package:budget_raro/shared/themes/text_styles.dart';
import 'package:budget_raro/shared/widgets/button_widget.dart';
import 'package:budget_raro/shared/widgets/custom_app_bar_balance_widget.dart';
import 'package:budget_raro/shared/widgets/transactions_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TransactionsPage extends StatefulWidget {
  TransactionsPage({Key? key}) : super(key: key);

  @override
  _TransactionsPageState createState() => _TransactionsPageState();
}

class _TransactionsPageState
    extends ModularState<TransactionsPage, TransactionsController> {
  @override
  void initState() {
    controller.firebaseRepository.firebaseInitialize();
    controller.getTransactions(controller.initialMonth);
    super.initState();
  }

  GlobalKey<ScaffoldState> _key = GlobalKey();
  final PageController pageController = PageController(initialPage: 0);

  void toCreatePage() {
    Navigator.pushNamed(context, '/create');
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        key: _key,
        appBar: CustomAppBarBalanceWidget(
          items: controller.months,
          value: controller.initialMonth,
          onChange: (String? value) {
            controller.initialMonth = value!;
            controller.getTransactions(controller.initialMonth);
          },
          onTabAll: () async {
            await pageController.animateToPage(2,
                duration: Duration(milliseconds: 500), curve: Curves.ease);
            setState(() {});
          },
          onTabIn: () async {
            await pageController.animateToPage(0,
                duration: Duration(milliseconds: 500), curve: Curves.ease);
            setState(() {});
          },
          onTabOut: () async {
            await pageController.animateToPage(1,
                duration: Duration(milliseconds: 500), curve: Curves.ease);
            setState(() {});
          },
          pageController: pageController,
          balance:
              controller.monthyValue.toStringAsFixed(2).replaceAll('.', ','),
          drawerKey: _key,
        ),
        body: PageView(
          controller: pageController,
          scrollDirection: Axis.horizontal,
          allowImplicitScrolling: false,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 40.0),
                child: Flex(direction: Axis.horizontal, children: [
                  TransactionsCard(
                    transactions: controller.inTransactions,
                    total: controller.inValue.toDouble(),
                    transactionType: "entrada",
                  ),
                ]),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 40.0),
                child: Flex(direction: Axis.horizontal, children: [
                  TransactionsCard(
                    transactions: controller.outTransactions,
                    total: controller.outValue.toDouble(),
                    transactionType: "saída",
                  ),
                ]),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 40.0),
                child: Flex(direction: Axis.horizontal, children: [
                  TransactionsCard(
                    transactions: controller.allTransactions,
                    total:
                        (controller.inValue + controller.outValue).toDouble(),
                    transactionType: "geral",
                  ),
                ]),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CustomButton.add(onTap: () {
          pageController.page == 0 || pageController.page == 2
              ? Modular.to
                  .pushNamed('/transactions/create', arguments: 'Entrada')
              : Modular.to
                  .pushNamed('/transactions/create', arguments: 'Saida');
        }),
      ),
    );
  }
}
