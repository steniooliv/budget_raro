import 'package:budget_raro/modules/home/home_controller.dart';
import 'package:budget_raro/modules/home/widgets/daily_balance_card_widget.dart';
import 'package:budget_raro/modules/home/widgets/dropdown_select_month_widget.dart';
import 'package:budget_raro/modules/home/widgets/general_balance_card_widget.dart';
import 'package:budget_raro/modules/home/widgets/last_transactions_card_widget.dart';
import 'package:budget_raro/shared/widgets/button_widget.dart';
import 'package:budget_raro/shared/widgets/custom_app_bar_widget.dart';
import 'package:budget_raro/shared/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    controller.firebaseRepository.firebaseInitialize();
    controller.getUser();
    controller.getBalance();
    controller.getTransactions(controller.initialMonth);
    controller.listLastTransactions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        key: _key,
        drawer: DrawerWidget(
          onTap: () => Modular.to
              .pushNamed('/home/profile', arguments: controller.userModel),
        ),
        appBar: CustomAppBarWidget(
          drawerKey: _key,
          welcome:
              'Olá, ${controller.userModel != null ? controller.userModel!.name!.substring(0, controller.userModel!.name!.indexOf(" ")) : ""}',
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              GeneralBalanceCard(
                balanceValue: controller.balanceValue
                    .toStringAsFixed(2)
                    .replaceAll('.', ','),
              ),
              DailyBalanceCard(
                monthyValue: controller.monthyValue,
                inValue: controller.inValue,
                outValue: controller.outValue,
                dropDown: DropDownSelectMonthWidget(
                  value: controller.initialMonth,
                  items: controller.months
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                  onChange: (String? value) {
                    controller.initialMonth = value!;
                    controller.getTransactions(controller.initialMonth);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: LastTransactionsCard(
                  lastTransactions: controller.lastTransactions,
                  subtotal: controller.lastTransactionsValue.toDouble(),
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CustomButton.refresh(onTap: () {
          controller.getBalance();
          controller.getTransactions(controller.initialMonth);
          controller.listLastTransactions();
        }),
      ),
    );
  }
}
