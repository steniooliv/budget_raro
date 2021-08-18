import 'package:budget_raro/shared/models/transaction_model.dart';
import 'package:budget_raro/shared/themes/text_styles.dart';
import 'package:budget_raro/shared/utils/formatter.dart';
import 'package:flutter/material.dart';

class TransactionListBuilderWidget extends StatelessWidget {
  final List<TransactionModel> transactions;

  const TransactionListBuilderWidget({
    Key? key,
    required this.transactions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Formatter format = Formatter();

    return Expanded(
      child: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (context, i) {
            return ListTile(
              title: Text(
                "${transactions[i].tag} ${transactions[i].description}",
                style: TextStyles.inputTextMedium,
              ),
              subtitle: Text(
                format.data(transactions[i].date),
                style: TextStyles.body2,
              ),
              leading: Image.asset(
                "assets/images/icons/${transactions[i].tag.replaceAll('çã', 'ca')}.png",
                width: 40,
                height: 40,
              ),
              trailing: Text(
                format.real(transactions[i].value),
                style: TextStyles.subtitle1,
              ),
            );
          }),
    );
  }
}
