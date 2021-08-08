import 'package:budget_raro/shared/themes/app_colors.dart';
import 'package:budget_raro/shared/themes/text_styles.dart';
import 'package:budget_raro/shared/utils/formatter.dart';
import 'package:budget_raro/shared/widgets/base-card-widget.dart';
import 'package:flutter/material.dart';

class LastTransactionsCard extends StatelessWidget {
  const LastTransactionsCard({
    Key? key,
    required this.lastTransactions,
  }) : super(key: key);
  final List<TransactionModel> lastTransactions;
  final double subtotal;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 302,
      child: BaseCardWidget(
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: AppColors.purple,
                        size: 26,
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
                  Text(
                    "No momento",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xffC4C4C4)
                    )
                  ),
                ],
              ),
            ),
            TransactionListBuilder(transactions: lastTransactions),
          ],
        ),
      ),
    );
  }
}
