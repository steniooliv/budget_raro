import 'package:budget_raro/modules/transactions/edit_transaction/edit_transaction_controller.dart';
import 'package:budget_raro/shared/themes/text_styles.dart';
import 'package:budget_raro/shared/widgets/base_card_widget.dart';
import 'package:budget_raro/shared/widgets/button_widget.dart';
import 'package:budget_raro/shared/widgets/custom_app_bar_expanded_widget.dart';
import 'package:budget_raro/shared/widgets/custom_textformfield_widget.dart';
import 'package:budget_raro/shared/widgets/drawer_widget.dart';
import 'package:budget_raro/shared/widgets/dropdown_transactions_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EditTransactionPage extends StatefulWidget {
  final String type;
  final double value;
  final String title;
  final DateTime date;

  EditTransactionPage({
    Key? key,
    required this.type,
    required this.value,
    required this.title,
    required this.date,
  }) : super(key: key);

  @override
  _EditTransactionPageState createState() => _EditTransactionPageState();
}

class _EditTransactionPageState
    extends ModularState<EditTransactionPage, EditTransactionController> {
  DateTime _date = DateTime.now();

  GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: DrawerWidget(),
      appBar: CustomAppBarExpandedWidget(
        transactionType: widget.type,
        drawerKey: _key,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: BaseCardWidget(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  CustomTextFormFieldWidget(
                    label: "Valor em R\$",
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  CustomTextFormFieldWidget(
                    label: "Descrição",
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Container(
                      width: double.maxFinite,
                      child: widget.type == 'Entrada'
                          ? DropdownTransactionsButtonWidget.entry()
                          : DropdownTransactionsButtonWidget.out()),
                  SizedBox(
                    height: 24,
                  ),
                  TextButton(
                    onPressed: () {
                      showDatePicker(
                        initialEntryMode: DatePickerEntryMode.calendarOnly,
                        context: context,
                        initialDate: _date,
                        firstDate: DateTime(2021),
                        lastDate: DateTime(2099),
                      ).then((date) {
                        setState(() {
                          _date = date!;
                        });
                      });
                    },
                    child: Text(
                      '${_date.day}/${_date.month}/${_date.year}',
                      style: TextStyles.inputDate,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomButton.inserirTransacao(onTap: () {}),
    );
  }
}
