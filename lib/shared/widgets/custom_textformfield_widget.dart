import 'package:budget_raro/shared/themes/app_colors.dart';
import 'package:budget_raro/shared/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String label;
  final String? Function(String? value)? validator;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final FormFieldSetter<String>? onSaved;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final String? helperText;
  final String? errorText;
  final TextCapitalization? textCapitalization;
  final FocusNode? focusNode;
  final AutovalidateMode? autovalidateMode;
  final bool? enabled;
  final String? initialValue;
  
  const CustomTextFormFieldWidget({
    Key? key,
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
    this.errorText,
    this.textCapitalization,
    this.focusNode,
    this.autovalidateMode,
    this.enabled,
    this.initialValue,
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
        validator: validator,
        focusNode: focusNode,
        enabled: enabled,
        initialValue: initialValue,
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
          helperStyle: TextStyle(
            fontFamily: "Roboto",
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Colors.black.withOpacity(.54),
          ),
          errorText: errorText,
        ));
  }
}
