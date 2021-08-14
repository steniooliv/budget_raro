import 'package:budget_raro/shared/models/transaction_model.dart';
import 'package:budget_raro/shared/themes/app_colors.dart';
import 'package:budget_raro/shared/themes/text_styles.dart';
import 'package:budget_raro/shared/widgets/dropdown_transactions_button/transaction_types.dart';
import 'package:flutter/material.dart';


class DropdownTransactionsButton extends StatefulWidget {
  
  DropdownTransactionsButton.entry({
    Key? key,
    this.transactionsType = true,
  }) : super(key: key);
  
  DropdownTransactionsButton.out({
    Key? key,
    this.transactionsType = false,
  }) : super(key: key);
  
  final bool transactionsType;

  @override
  _DropdownTransactionsButtonState createState() => _DropdownTransactionsButtonState();
}

class _DropdownTransactionsButtonState extends State<DropdownTransactionsButton> { 
  
  TransactionTypes? transactionSelected;

  @override
  Widget build(BuildContext context) {
    List<TransactionTypes> transactions = widget.transactionsType
    ? transactionTypeIn
    : transactionTypeOut;
    return DropdownButton<TransactionTypes>(
      menuMaxHeight: MediaQuery.of(context).size.height/2,
      value: transactionSelected,
      hint: Align(
        alignment: Alignment.centerLeft,
        child: Text("Escolha", 
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
      onChanged: (TransactionTypes? selected) {
        setState(() {
          transactionSelected = transactions
          .firstWhere((e) => e.tag == selected!.tag);
        });
      },
      selectedItemBuilder: (BuildContext context) {
        return transactions
        .map<Widget>((TransactionTypes item) {
          return Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 220,
              child: Text(
                item.tag,
                style: TextStyles.components,
              )
            )
          );
        }).toList();
      },
      items: transactions
      .map<DropdownMenuItem<TransactionTypes>>(
        (TransactionTypes transaction) {
        return DropdownMenuItem<TransactionTypes>(
          value: transaction,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 26,
                width: 26,
                child: Image(
                  image: AssetImage(
                    transaction.icon
                  ),
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

List<TransactionTypes> transactionTypeIn = [
  TransactionTypes(tag: "Pix", icon: "assets/images/icons/Pix.png"),
  TransactionTypes(tag: "Dinheiro", icon: "assets/images/icons/Dinheiro.png"),
  TransactionTypes(tag: "Boleto", icon: "assets/images/icons/Boleto.png"),
  TransactionTypes(tag: "Ted", icon: "assets/images/icons/Ted.png"),
  TransactionTypes(tag: "Doc", icon: "assets/images/icons/Doc.png"),
];

List<TransactionTypes> transactionTypeOut = [
  TransactionTypes(tag: "Refeição", icon: "assets/images/icons/Refeicao.png"),
  TransactionTypes(tag: "Transporte", icon: "assets/images/icons/Transporte.png"),
  TransactionTypes(tag: "Educação", icon: "assets/images/icons/Educacao.png"),
  TransactionTypes(tag: "Viagem", icon: "assets/images/icons/Viagem.png"),
  TransactionTypes(tag: "Pagamentos", icon: "assets/images/icons/Pagamentos.png"),
  TransactionTypes(tag: "Outro", icon: "assets/images/icons/Outro.png"),
];