import 'package:budget_raro/shared/themes/app_colors.dart';
import 'package:budget_raro/shared/themes/text_styles.dart';
import 'package:budget_raro/shared/models/transaction_types_model.dart';
import 'package:flutter/material.dart';

class DropdownTransactionsButtonWidget extends StatefulWidget {
  DropdownTransactionsButtonWidget.entry({
    Key? key,
    this.transactionsType = true,
    this.onChange,
  }) : super(key: key);

  DropdownTransactionsButtonWidget.out({
    Key? key,
    this.transactionsType = false,
    this.onChange,
  }) : super(key: key);

  final bool transactionsType;
  final Function(TransactionTypesModel?)? onChange;

  @override
  _DropdownTransactionsButtonStateWidget createState() =>
      _DropdownTransactionsButtonStateWidget();
}

class _DropdownTransactionsButtonStateWidget
    extends State<DropdownTransactionsButtonWidget> {
  TransactionTypesModel? transactionSelected;

  @override
  Widget build(BuildContext context) {
    List<TransactionTypesModel> transactions =
        widget.transactionsType ? transactionTypeIn : transactionTypeOut;
    return DropdownButton<TransactionTypesModel>(
      menuMaxHeight: MediaQuery.of(context).size.height / 2,
      value: transactionSelected,
      hint: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Escolha",
          style: TextStyles.components,
        ),
      ),
      icon: Icon(
        Icons.arrow_drop_down,
        color: AppColors.black.withOpacity(0.54),
      ),
      iconSize: 24,
      elevation: 0,
      style: TextStyles.inputText,
      underline: Container(
        height: 1,
        color: Colors.black.withOpacity(0.42),
      ),
      onChanged: widget.onChange,
      selectedItemBuilder: (BuildContext context) {
        return transactions.map<Widget>((TransactionTypesModel item) {
          return Align(
              alignment: Alignment.centerLeft,
              child: Container(
                  width: 220,
                  child: Text(
                    item.tag,
                    style: TextStyles.components,
                  )));
        }).toList();
      },
      items: transactions.map<DropdownMenuItem<TransactionTypesModel>>(
          (TransactionTypesModel transaction) {
        return DropdownMenuItem<TransactionTypesModel>(
          value: transaction,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 26,
                width: 26,
                child: Image(
                  image: AssetImage(transaction.icon),
                  width: 24,
                  height: 24,
                ),
              ),
              SizedBox(width: 8),
              Text(transaction.tag),
            ],
          ),
        );
      }).toList(),
    );
  }
}

List<TransactionTypesModel> transactionTypeIn = [
  TransactionTypesModel(
    category: 'pix',
    tag: "Pix",
    icon: "assets/images/icons/pix.png",
  ),
  TransactionTypesModel(
    category: 'money',
    tag: "Dinheiro",
    icon: "assets/images/icons/money.png",
  ),
  TransactionTypesModel(
    category: 'invoice',
    tag: "Boleto",
    icon: "assets/images/icons/invoice.png",
  ),
  TransactionTypesModel(
    category: 'payment',
    tag: "Ted",
    icon: "assets/images/icons/payment.png",
  ),
  TransactionTypesModel(
    category: 'payment',
    tag: "Doc",
    icon: "assets/images/icons/payment.png",
  ),
];

List<TransactionTypesModel> transactionTypeOut = [
  TransactionTypesModel(
    category: 'food',
    tag: "Refeição",
    icon: "assets/images/icons/food.png",
  ),
  TransactionTypesModel(
    category: 'transport',
    tag: "Transporte",
    icon: "assets/images/icons/transport.png",
  ),
  TransactionTypesModel(
    category: 'education',
    tag: "Educação",
    icon: "assets/images/icons/education.png",
  ),
  TransactionTypesModel(
    category: 'travel',
    tag: "Viagem",
    icon: "assets/images/icons/travel.png",
  ),
  TransactionTypesModel(
    category: 'payment',
    tag: "Pagamentos",
    icon: "assets/images/icons/payments.png",
  ),
  TransactionTypesModel(
    category: 'other',
    tag: "Outro",
    icon: "assets/images/icons/other.png",
  ),
];
