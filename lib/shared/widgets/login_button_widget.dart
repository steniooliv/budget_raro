import 'package:budget_raro/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:budget_raro/shared/themes/text_styles.dart';

class LoginButton extends StatelessWidget {
  final double aux;
  final Function() onTap;
  const LoginButton({
    Key? key,
  required this.aux,
  required this.onTap,
  }) : super(key: key);

  const LoginButton.google({
    Key? key,
  this.aux = 1,
  required this.onTap,
  }) : super(key: key);

  const LoginButton.facebook({
    Key? key,
  this.aux = 0,
  required this.onTap,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    Color cor = Colors.white;
    List<Widget> content =[];
    if (aux == 1) {
      content =[Image.asset("assets/images/logo_google.png",),Text("   CONTINUAR COM O GOOGLE", style: TextStyles.googleButton,)];
    }
    if (aux == 0){
      cor = AppColors.face;
      content =[Image.asset("assets/images/logo_facebook.png",),Text("   CONTINUAR COM O FACEBOOK", style: TextStyles.facebookButton,), ];
    }
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 36,
        width: 267,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.00),
          color: cor,
          border: Border.all(width: aux ,color: Color(0xFFBDBDBD)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: content, 
        ), 
      ),
    );
  }
}