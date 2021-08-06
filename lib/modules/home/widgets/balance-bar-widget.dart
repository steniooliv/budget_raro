import 'package:budget_raro/shared/themes/app_colors.dart';
import 'package:budget_raro/shared/themes/text_styles.dart';
import 'package:budget_raro/shared/utils/formatter.dart';
import 'package:flutter/material.dart';


class BalanceBarWidget extends StatelessWidget {

  final double entryValue;
  final double outValue;

  const BalanceBarWidget({
    Key? key,
    required this.entryValue,
    required this.outValue,
  }) : super(key: key);

  
  @override
  Widget build(BuildContext context) {

    double maxWidht = MediaQuery.of(context).size.width - 64;
    double totalBalance = entryValue + outValue.abs();
    double entryBarWidth = (maxWidht/(totalBalance+1))*entryValue;
    double outBarWidth = (maxWidht/(totalBalance+1))*outValue;
    String entryValueString = Formatter().real(entryValue);
    String outValueString = Formatter().real(outValue);

    return  Column(
      children: [
        GestureDetector(
          child: barWidget(
            "Saídas", outValueString, outBarWidth,
            AppColors.cyan, textSizeCalculator 
          ),
          onTap: (){},// NAVEGAR PARA A TELA TRANSAÇÕES SAÍDAS 
        ),
        GestureDetector(
          child: barWidget(
            "Entradas", entryValueString, entryBarWidth,
            AppColors.yellow, textSizeCalculator
          ),
          onTap: (){},// NAVEGAR PARA A TELA TRANSAÇÕES ENTRADAS
        ),
      ],
    );
  }
}

Widget barWidget(
  String label, String value, double barWidth,
  Color color, Function textSizeCalculator) {
  
  var minTextSize = textSizeCalculator("$label  $value", TextStyles.body2);
  bool isSmaller = barWidth < minTextSize.width;

  return Align(
    alignment: Alignment.centerLeft,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.only(top:16),
          width: isSmaller ? minTextSize.width+1 : barWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: TextStyles.subtitle),
              Text("  $value", style: TextStyles.body2),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top:4),
          height: 11,
          width: barWidth,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5.5),
          ),
        ),
      ],
    ),
  );
}

  Size textSizeCalculator(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
      textScaleFactor: WidgetsBinding.instance!.window.textScaleFactor,
    )..layout();
    return textPainter.size;
  }
