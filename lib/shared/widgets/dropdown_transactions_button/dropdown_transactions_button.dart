import 'package:budget_raro/shared/models/transaction_model.dart';
import 'package:budget_raro/shared/themes/app_colors.dart';
import 'package:budget_raro/shared/themes/text_styles.dart';
import 'package:flutter/material.dart';

class DropdownTransactionsButton extends StatefulWidget {
  DropdownTransactionsButton({
    Key? key,
    required this.transactions,
  }) : super(key: key);
  
  final List<TransactionModel> transactions;

  @override
  _DropdownTransactionsButtonState createState() => _DropdownTransactionsButtonState();
}

class _DropdownTransactionsButtonState extends State<DropdownTransactionsButton> { 
  
  TransactionModel? transactionSelected;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<TransactionModel>(
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
      onChanged: (TransactionModel? selected) {
        setState(() {
          transactionSelected = widget.transactions
          .firstWhere((e) => e.tag == selected!.tag);
        });
      },
      selectedItemBuilder: (BuildContext context) {
        return widget.transactions
        .map<Widget>((TransactionModel item) {
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
      items: widget.transactions
      .map<DropdownMenuItem<TransactionModel>>(
        (TransactionModel transaction) {
        return DropdownMenuItem<TransactionModel>(
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
                    "image/icons/${transaction.tag
                    .replaceAll('çã', 'ca')}.png"
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
