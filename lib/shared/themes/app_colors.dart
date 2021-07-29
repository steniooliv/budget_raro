import 'package:flutter/widgets.dart';

class AppColors {
  static final cyan = Color(0xFF44C2FD);
  static final purple = Color(0xFF343090);
  static final green = Color(0xFF58B368);
  static final red = Color(0xFFF44336);
  static final pink = Color(0xFFF5487F);
  static final yellow = Color(0xFFFAC736);
  static final white = Color(0xFFFFFFFF);
  static final whiteSlogan = Color(0xFFFDFDFD);
  static final black = Color(0xFF000000);
  static final grey = Color(0xFFC4C4C4);

  static final whiteDropDown = Color(0xFFFFFFFF).withOpacity(0.1);

  static final linear = LinearGradient(
    colors: [AppColors.cyan, AppColors.purple],
    begin: Alignment(-2, -0.8),
    end: Alignment(0.7, 0),
  );
}
