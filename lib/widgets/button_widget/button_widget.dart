import 'package:budget_raro/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double buttonHeight;
  final double buttonWidth;
  final List<Widget> buttonContent;
  const CustomButton({
    Key? key,
  required this.buttonHeight,
  required this.buttonWidth,
  required this.buttonContent,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
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
          children: buttonContent   
        ), 
      ),
    );
  }
}
