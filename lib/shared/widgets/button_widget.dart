import 'package:budget_raro/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:budget_raro/shared/themes/text_styles.dart';

class CustomButton extends StatelessWidget {
  final double buttonHeight;
  final double buttonWidth;
  final String buttonContent;
  final IconData icon;
  final int aux;
  final Function() onTap;
  const CustomButton({
    Key? key,
    required this.buttonHeight,
    required this.buttonWidth,
    required this.buttonContent,
    required this.icon,
    required this.aux,
    required this.onTap,
  }) : super(key: key);

  const CustomButton.continuar({
    Key? key,
    this.buttonHeight = 36,
    this.buttonWidth = 114,
    this.buttonContent = 'CONTINUAR',
    this.icon = Icons.add,
    this.aux = 3,
    required this.onTap,
  }) : super(key: key);

  const CustomButton.salvar({
    Key? key,
    this.buttonHeight = 50,
    this.buttonWidth = 192,
    this.buttonContent = 'SALVAR ALTERAÇÕES',
    this.icon = Icons.add,
    this.aux = 3,
    required this.onTap,
  }) : super(key: key);

  const CustomButton.add({
    Key? key,
    this.buttonHeight = 48,
    this.buttonWidth = 48,
    this.buttonContent = "",
    this.icon = Icons.add,
    this.aux = 1,
    required this.onTap,
  }) : super(key: key);

  const CustomButton.refresh({
    Key? key,
    this.buttonHeight = 48,
    this.buttonWidth = 48,
    this.buttonContent = "",
    this.icon = Icons.refresh,
    this.aux = 1,
    required this.onTap,
  }) : super(key: key);

  const CustomButton.continuarArrow({
    Key? key,
    this.buttonHeight = 32,
    this.buttonWidth = 116,
    this.buttonContent = 'CONTINUAR  ',
    this.icon = Icons.arrow_forward,
    this.aux = 1,
    required this.onTap,
  }) : super(key: key);

  const CustomButton.novoControle({
    Key? key,
    this.buttonHeight = 40,
    this.buttonWidth = 182,
    this.buttonContent = '   NOVO CONTROLE',
    this.icon = Icons.add,
    this.aux = 2,
    required this.onTap,
  }) : super(key: key);

  const CustomButton.tentar({
    Key? key,
    this.buttonHeight = 36,
    this.buttonWidth = 178,
    this.buttonContent = 'TENTAR NOVAMENTE',
    this.icon = Icons.add,
    this.aux = 3,
    required this.onTap,
  }) : super(key: key);

  const CustomButton.inserirTransacao({
    Key? key,
    this.buttonHeight = 50,
    this.buttonWidth = 123,
    this.buttonContent = '  INSERIR',
    this.icon = Icons.add,
    this.aux = 2,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> content = [];
    if (aux == 1) {
      content = [
        Text(
          buttonContent,
          style: TextStyles.textButton,
        ),
        Icon(
          icon,
          color: Colors.white,
        )
      ];
    }
    if (aux == 2) {
      content = [
        Icon(
          icon,
          color: Colors.white,
        ),
        Text(
          buttonContent,
          style: TextStyles.textButton,
        )
      ];
    }
    if (aux == 3) {
      content = [
        Text(
          buttonContent,
          style: TextStyles.textButton,
        )
      ];
    }

    return InkWell(
      onTap: onTap,
      child: Container(
        height: buttonHeight,
        width: buttonWidth,
        decoration: BoxDecoration(
            gradient: AppColors.linear,
            borderRadius: BorderRadius.circular(100.00),
            boxShadow: [
              BoxShadow(
                color: Color(0x1F000000).withOpacity(0.12),
                offset: Offset(0.0, 1.0),
                blurRadius: 5.0,
              ),
              BoxShadow(
                color: Color(0x24000000).withOpacity(0.14),
                offset: Offset(0.0, 2.0),
                blurRadius: 2.0,
              ),
              BoxShadow(
                color: Color(0x33000000).withOpacity(0.20),
                offset: Offset(0.0, 3.0),
                blurRadius: 1.0,
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: content,
        ),
      ),
    );
  }
}
