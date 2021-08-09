import 'package:budget_raro/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

/* Informar parâmetros icon, coloricon, background (opcional,
se não informado será o gradiente padrão)

exemplo:

TransactionIcon(
  icon: IconsCustom.pix,
  coloricon: AppColors.white,
  background: AppColors.red,
),

*/

class TransactionIcon extends StatelessWidget {
  final IconData icon;
  final Color coloricon;
  //final double sizeicon;
  final double tamicon = 20.0;
  final Color? background;

  const TransactionIcon({
    Key? key,
    required this.icon,
    required this.coloricon,
    this.background,
    //required this.sizeicon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircleAvatar(
        child: Icon(
          icon,
          //size: sizeicon,
          size: tamicon,
          color: coloricon,
        ),
        backgroundColor: background != null ? background : Colors.transparent,
        radius: 20,
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        //color: background,
        gradient: AppColors.linear,
      ),
    );
  }
}
