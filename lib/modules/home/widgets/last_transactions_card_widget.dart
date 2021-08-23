import 'package:budget_raro/shared/models/transaction_model.dart';
import 'package:budget_raro/shared/themes/app_colors.dart';
import 'package:budget_raro/shared/themes/text_styles.dart';
import 'package:budget_raro/shared/utils/formatter.dart';
import 'package:budget_raro/shared/widgets/base_card_widget.dart';
import 'package:budget_raro/shared/widgets/transactions_listbuilder_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LastTransactionsCard extends StatelessWidget {
  const LastTransactionsCard({
    Key? key,
    required this.lastTransactions,
    required this.subtotal,
  }) : super(key: key);

  final List<TransactionModel> lastTransactions;
  final double subtotal;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.8,
      child: BaseCardWidget(
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Últimas transações",
                        style: TextStyles.h6,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.keyboard_arrow_right,
                          color: AppColors.purple,
                          size: 26,
                        ),
                        onPressed: () {
                          Modular.to.pushNamed('/transactions');
                        },
                      ),
                    ],
                  ),
                  Text(
                    Formatter().real(subtotal),
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w400,
                      fontSize: 24,
                      color: Colors.black.withOpacity(0.54),
                      height: 1.5,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text("No momento",
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color(0xffC4C4C4))),
                ],
              ),
            ),
            TransactionListBuilderWidget(transactions: lastTransactions),
          ],
        ),
      ),
    );
  }
}
