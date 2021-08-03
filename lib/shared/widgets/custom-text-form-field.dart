import 'package:budget_raro/shared/themes/app_colors.dart';
import 'package:budget_raro/shared/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String label;
  final Function(String? value)? validator;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final FormFieldSetter<String>? onSaved;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;  
  final List<TextInputFormatter>? inputFormatters;
  final String? helperText;
  final String? errorMessage;

  const CustomTextFormField({
    Key ? key,
    required this.label,
    this.textInputAction,
    this.suffixIcon,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.onSaved, 
    this.validator,
    this.onChanged,
    this.inputFormatters,
    this.helperText,
    this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyles.inputText,
      textInputAction: textInputAction,
      controller: controller,
      keyboardType: keyboardType,
      onChanged: onChanged,
      obscureText: obscureText,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        labelText: label,
        labelStyle: TextStyle(
          fontFamily: "Roboto",
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.grey,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.purple, width: 2),
        ),
        helperText: helperText,  
        errorText: errorMessage,
      )
    );
  }
}