import 'package:budget_raro/modules/home/widgets/balance_bar_widget.dart';
import 'package:budget_raro/modules/home/widgets/dropdown_select_month_widget.dart';
import 'package:budget_raro/shared/themes/text_styles.dart';
import 'package:budget_raro/shared/widgets/base_card_widget.dart';
import 'package:flutter/material.dart';

class DailyBalanceCard extends StatefulWidget {
  const DailyBalanceCard({
    Key? key,
  }) : super(key: key);

  @override
  _DailyBalanceCardState createState() => _DailyBalanceCardState();
}

class _DailyBalanceCardState extends State<DailyBalanceCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {}, // NAVEGAR PARA TODAS AS TRANSAÇÕES;
      child: BaseCardWidget(
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
                  DropDownSelectMonthWidget(),
                ],
              ),
              Text(
                "R\$ 3.000,00", // RECEBE O VARIÁVEL COM SALDO DO MÊS SELECIONADO
                style: TextStyles.h5Black,
              ),
              BalanceBarWidget(
                  entryValue: 8000,
                  outValue: 5000), // RECEBE DADOS DE ENTRADA E SAÍDA
            ],
          ),
        ),
      ),
    );
  }
}