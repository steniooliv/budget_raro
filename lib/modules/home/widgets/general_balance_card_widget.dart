import 'package:flutter/material.dart';

import 'package:budget_raro/shared/themes/app_colors.dart';
import 'package:budget_raro/shared/themes/text_styles.dart';
import 'package:budget_raro/shared/widgets/base_card_widget.dart';
import 'package:budget_raro/shared/widgets/visible_password_widget.dart';

class GeneralBalanceCard extends StatefulWidget {
  final String balanceValue;

  const GeneralBalanceCard({
    Key? key,
    required this.balanceValue,
  }) : super(key: key);

  @override
  _GeneralBalanceCardState createState() => _GeneralBalanceCardState();
}

class _GeneralBalanceCardState extends State<GeneralBalanceCard> {
  bool balanceVisibility = true;

  @override
  Widget build(BuildContext context) {
    return BaseCardWidget(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Saldo geral", style: TextStyles.h6),
                VisibleWidget(
                  color: AppColors.purple,
                  visible: balanceVisibility,
                  onPressed: () {
                    setState(() {
                      balanceVisibility = !balanceVisibility;
                    });
                  },
                )
              ],
            ),
            Text(
                balanceVisibility
                    ? "R\$ ${widget.balanceValue}"
                    : "••••••••••••", // RECEBE O VARIÁVEL COM SALDO GERAL
                maxLines: 1,
                overflow: TextOverflow.clip,
                style: TextStyles.h5Black)
          ],
        ),
      ),
    );
  }
}
