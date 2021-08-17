import 'package:flutter/material.dart';

import 'package:budget_raro/shared/models/transaction_model.dart';
import 'package:budget_raro/shared/themes/text_styles.dart';
import 'package:budget_raro/shared/widgets/base-card-widget.dart';
import 'package:budget_raro/shared/widgets/button_widget/button_widget.dart';
import 'package:budget_raro/shared/widgets/custom-text-form-field.dart';
import 'package:budget_raro/shared/widgets/custom_app_bar/custom_app_bar_expanded_widget.dart';
import 'package:budget_raro/shared/widgets/drawer/drawer_widget.dart';
import 'package:budget_raro/shared/widgets/dropdown_transactions_button/dropdown_transactions_button.dart';

class CreatePage extends StatefulWidget {
  final String type;

  CreatePage({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  DateTime _date = DateTime.now();

  List<TransactionModel> _transactions = [];

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
                  CustomTextFormField(
                    label: "Valor em R\$",
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  CustomTextFormField(
                    label: "Descrição",
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Container(
                    width: double.maxFinite,
                    child:
                        DropdownTransactionsButton(transactions: _transactions),
                  ),
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
