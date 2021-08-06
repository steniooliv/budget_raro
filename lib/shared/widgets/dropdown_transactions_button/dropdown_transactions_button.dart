import 'package:budget_raro/shared/models/transactions_model.dart';
import 'package:budget_raro/shared/themes/app_colors.dart';
import 'package:budget_raro/shared/themes/text_styles.dart';
import 'package:flutter/material.dart';

class DropdownTransactionsButton extends StatefulWidget {
  DropdownTransactionsButton({
    Key? key,
    required this.transactions,
  }) : super(key: key);
  
  final List<TransactionsModel> transactions;

  @override
  _DropdownTransactionsButtonState createState() => _DropdownTransactionsButtonState();
}

class _DropdownTransactionsButtonState extends State<DropdownTransactionsButton> { 
  
  TransactionsModel? transactionSelected;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<TransactionsModel>(
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
      onChanged: (TransactionsModel? selected) {
        setState(() {
          transactionSelected = widget.transactions
          .firstWhere((e) => e.type == selected!.type);
        });
      },
      selectedItemBuilder: (BuildContext context) {
        return widget.transactions
        .map<Widget>((TransactionsModel item) {
          return Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 220,
              child: Text(
                item.type,
                style: TextStyles.components,
              )
            )
          );
        }).toList();
      },
      items: widget.transactions
      .map<DropdownMenuItem<TransactionsModel>>(
        (TransactionsModel transaction) {
        return DropdownMenuItem<TransactionsModel>(
          value: transaction,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 26,
                width: 26,
                child: Image(
                  image: AssetImage(transaction.image),
                  width: 24,
                  height: 24,
                ), 
              ),
              SizedBox(width: 8),
              Text(transaction.type),
            ],
          ),
        );
      }).toList(),
    );
  }
}
