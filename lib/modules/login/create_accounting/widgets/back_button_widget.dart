import 'package:budget_raro/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:budget_raro/shared/themes/text_styles.dart';

class BackButtonWidget extends StatelessWidget {
  final Function() onTap;
  const BackButtonWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.arrow_back, color: AppColors.lightGrey, size: 16),
            Text(
              "  VOLTAR",
              style: TextStyles.buttonMedium,
            )
          ],
        ),
      ),
    );
  }
}
