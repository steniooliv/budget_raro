import 'package:budget_raro/shared/themes/text_styles.dart';
import 'package:flutter/material.dart';
class CreateAccountButton extends StatelessWidget {
  final Function() onTap;
  const CreateAccountButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        child: Text(" Crie uma conta",style: TextStyles.ag,), 
      ), 
    ); 
  }
}