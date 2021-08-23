import 'package:budget_raro/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static final budgetTitle = GoogleFonts.montserrat(
    fontSize: 72,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.05,
    color: AppColors.white,
    shadows: [
      BoxShadow(
        color: AppColors.black.withOpacity(0.25),
        spreadRadius: 0,
        blurRadius: 15,
        offset: Offset(0, 4),
      ),
    ],
  );
  static final slogan = GoogleFonts.montserrat(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.08,
    color: AppColors.whiteSlogan,
  );
  static final powered = GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.italic,
    letterSpacing: 0.03,
    color: AppColors.white.withOpacity(0.5),
  );
  static final h3 = GoogleFonts.roboto(
    fontSize: 48,
    fontWeight: FontWeight.w400,
    color: AppColors.cyan,
  );
  static final back = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.grey,
  );
  static final pageNumber = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );
  static final onboarding = GoogleFonts.roboto(
    fontSize: 34,
    fontWeight: FontWeight.w700,
    color: AppColors.cyan,
  );
  static final h5Black = GoogleFonts.roboto(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    color: AppColors.black.withOpacity(0.87),
  );
  static final h5White = GoogleFonts.roboto(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );
  static final h6 = GoogleFonts.roboto(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.purple,
  );
  static final body = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.black.withOpacity(0.54),
  );
  static final body1 = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.black.withOpacity(0.54),
  );
  static final body2 = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.black.withOpacity(0.38),
  );
  static final body2ho = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.black.withOpacity(0.87),
  );
  static final body3 = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.purple,
  );
  static final subtitle = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.grey,
  );
  static final inputText = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.black.withOpacity(0.87),
  );
  static final inputDate = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.purple,
  );
  static final textButton = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );
  static final googleButton = GoogleFonts.roboto(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: Color(0x8A000000),
  );
  static final buttonSmall = GoogleFonts.roboto(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.purple,
  );
  static final facebookButton = GoogleFonts.roboto(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );
  static final balance = GoogleFonts.roboto(
    fontSize: 26,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
    shadows: [
      BoxShadow(
        color: AppColors.black.withOpacity(0.12),
        spreadRadius: 5,
        blurRadius: 32,
        offset: Offset(0, 6),
      ),
      BoxShadow(
        color: AppColors.black.withOpacity(0.14),
        spreadRadius: 2,
        blurRadius: 26,
        offset: Offset(0, 17),
      ),
    ],
  );
  static final tabActive = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );
  static final tabDisable = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.white.withOpacity(0.60),
  );
  static final transactionTitle = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.purple,
  );
  static final transactionValue = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.purple,
  );
  static final transactionDate = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.white.withOpacity(0.38),
  );
  static final transactionTotalOut = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.red,
  );
  static final transactionTotalIn = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.green,
  );
  static final drawerSection = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.black.withOpacity(0.54),
  );
  static final drawerOption = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.black.withOpacity(0.87),
  );
  static final components = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.black.withOpacity(0.54),
  );
  static final inputTextMedium = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.purple,
  );
  static final subtitle1 = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.purple,
  );
  static final buttonMedium = GoogleFonts.roboto(
      fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.lightGrey);
}
