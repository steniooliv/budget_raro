import 'package:budget_raro/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:budget_raro/shared/themes/text_styles.dart';

class CustomButton extends StatelessWidget {
  final double buttonHeight;
  final double buttonWidth;
  final String buttonText;
  final IconData icon;
  final int aux;
  const CustomButton({
    Key? key,
  required this.buttonHeight,
  required this.buttonWidth,
  required this.buttonText,
  required this.icon,
  required this.aux,
  }) : super(key: key);
  
  const CustomButton.continuar({
    Key? key,
  this.buttonHeight = 36,
  this.buttonWidth = 114,
  this.buttonText = 'CONTINUAR',
  this.icon = Icons.add,
  this.aux = 3,
  }) : super(key: key);

const CustomButton.add({
    Key? key,
  this.buttonHeight = 48,
  this.buttonWidth = 48,
  this.buttonText = "",
  this.icon = Icons.add,
  this.aux = 1,
  }) : super(key: key);

  const CustomButton.continuarArrow({
    Key? key,
  this.buttonHeight = 32,
  this.buttonWidth = 116,
  this.buttonText = 'CONTINUAR  ',
  this.icon = Icons.arrow_forward,
  this.aux = 1,
  }) : super(key: key);

  const CustomButton.novoControle({
    Key? key,
  this.buttonHeight = 40,
  this.buttonWidth = 182,
  this.buttonText = '   NOVO CONTROLE',
  this.icon = Icons.add,
  this.aux = 2,
  }) : super(key: key);

  const CustomButton.tentar({
    Key? key,
  this.buttonHeight = 36,
  this.buttonWidth = 178,
  this.buttonText = 'TENTAR NOVAMENTE',
  this.icon = Icons.add,
  this.aux = 3,
  }) : super(key: key);

  const CustomButton.inserirEntrada({
    Key? key,
  this.buttonHeight = 50,
  this.buttonWidth = 123,
  this.buttonText = '  INSERIR',
  this.icon = Icons.add,
  this.aux = 2,
  }) : super(key: key);

  const CustomButton.inserirSaida({
    Key? key,
  this.buttonHeight = 50,
  this.buttonWidth = 123,
  this.buttonText = '  INSERIR',
  this.icon = Icons.add,
  this.aux = 2,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    List<Widget> content =[];
    if (aux == 1) {
      content =[Text(buttonText, style: TextStyles.textButton,), Icon(icon, color: Colors.white,)];
    }
    if (aux == 2){
      content =[Icon(icon, color: Colors.white,), Text(buttonText, style: TextStyles.textButton,)];
    }
    if (aux == 3) {
      content =[Text(buttonText, style: TextStyles.textButton,)];
    }
    
    return InkWell(
      onTap: () {},
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
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: content, 
        ), 
      ),
    );
  }
}