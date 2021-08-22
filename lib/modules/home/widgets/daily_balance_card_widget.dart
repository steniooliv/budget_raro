import 'package:budget_raro/shared/utils/formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:budget_raro/modules/home/widgets/balance_bar_widget.dart';
import 'package:budget_raro/shared/themes/text_styles.dart';
import 'package:budget_raro/shared/widgets/base_card_widget.dart';

class DailyBalanceCard extends StatefulWidget {
  final Widget? dropDown;
  final num? monthyValue;
  final num? inValue;
  final num? outValue;

  const DailyBalanceCard({
    Key? key,
    this.dropDown,
    this.monthyValue,
    this.inValue,
    this.outValue,
  }) : super(key: key);

  @override
  _DailyBalanceCardState createState() => _DailyBalanceCardState();
}

class _DailyBalanceCardState extends State<DailyBalanceCard> {
  @override
  Widget build(BuildContext context) {
    return BaseCardWidget(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Dia a dia", style: TextStyles.h6),
                widget.dropDown ?? Container(),
              ],
            ),
            Text(
              " R\$ ${(widget.monthyValue ?? 0).toStringAsFixed(2).replaceAll('.', ',')}",
              style: TextStyles.h5Black,
            ),
            BalanceBarWidget(
                entryValue: widget.inValue ?? 0,
                outValue: widget.outValue ?? 0),
          ],
        ),
      ),
    );
  }
}
