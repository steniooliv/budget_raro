import 'package:budget_raro/shared/models/transaction_model.dart';
import 'package:budget_raro/shared/themes/text_styles.dart';
import 'package:budget_raro/shared/utils/formatter.dart';
import 'package:budget_raro/shared/widgets/transactions_card/transactions_listbuilder.dart';
import 'package:flutter/material.dart';
import '../base-card-widget.dart';


class TransactionsCard extends StatelessWidget {
  
  final List<TransactionModel> transactions;
  final String? transactionType;
  final double total;
  
  const TransactionsCard({
    Key? key,
    required this.transactions,
    this.transactionType = "",
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BaseCardWidget(
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            TransactionListBuilder(
              transactions: transactions
            ),
            Divider(),
            Container(
              padding: EdgeInsets.only(
                right: 16,
                left: 16,
                top: 16,
                bottom: 20,
              ),
              height: 54,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total $transactionType",
                    style: TextStyles.inputTextMedium,
                  ),
                  Text(
                    Formatter().real(total),
                    style: total >= 0
                      ? TextStyles.transactionTotalIn
                      : TextStyles.transactionTotalOut
                  ),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
