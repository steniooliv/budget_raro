import 'package:budget_raro/shared/themes/app_colors.dart';
import 'package:budget_raro/shared/themes/text_styles.dart';
import 'package:budget_raro/shared/models/transaction_types_model.dart';
import 'package:flutter/material.dart';

class DropdownTransactionsButtonWidget extends StatefulWidget {
  DropdownTransactionsButtonWidget.entry({
    Key? key,
    this.transactionsType = true,
  }) : super(key: key);

  DropdownTransactionsButtonWidget.out({
    Key? key,
    this.transactionsType = false,
  }) : super(key: key);

  final bool transactionsType;

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
      onChanged: (TransactionTypesModel? selected) {
        setState(() {
          transactionSelected =
              transactions.firstWhere((e) => e.tag == selected!.tag);
        });
      },
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
  TransactionTypesModel(tag: "Pix", icon: "assets/images/icons/Pix.png"),
  TransactionTypesModel(
      tag: "Dinheiro", icon: "assets/images/icons/Dinheiro.png"),
  TransactionTypesModel(tag: "Boleto", icon: "assets/images/icons/Boleto.png"),
  TransactionTypesModel(tag: "Ted", icon: "assets/images/icons/Ted.png"),
  TransactionTypesModel(tag: "Doc", icon: "assets/images/icons/Doc.png"),
];

List<TransactionTypesModel> transactionTypeOut = [
  TransactionTypesModel(
      tag: "Refeição", icon: "assets/images/icons/Refeicao.png"),
  TransactionTypesModel(
      tag: "Transporte", icon: "assets/images/icons/Transporte.png"),
  TransactionTypesModel(
      tag: "Educação", icon: "assets/images/icons/Educacao.png"),
  TransactionTypesModel(tag: "Viagem", icon: "assets/images/icons/Viagem.png"),
  TransactionTypesModel(
      tag: "Pagamentos", icon: "assets/images/icons/Pagamentos.png"),
  TransactionTypesModel(tag: "Outro", icon: "assets/images/icons/Outro.png"),
];
