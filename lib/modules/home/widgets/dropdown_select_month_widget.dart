import 'package:flutter/material.dart';

import 'package:budget_raro/shared/themes/app_colors.dart';

class DropDownSelectMonthWidget extends StatefulWidget {
  final Function(String?)? onChange;
  final String? value;
  final List<DropdownMenuItem<String>>? items;

  const DropDownSelectMonthWidget({
    Key? key,
    required this.onChange,
    this.value,
    this.items,
  }) : super(key: key);

  @override
  State<DropDownSelectMonthWidget> createState() =>
      _DropDownSelectMonthWidgetState();
}

class _DropDownSelectMonthWidgetState extends State<DropDownSelectMonthWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      width: 94,
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
      child: Center(
        child: DropdownButton<String>(
          value: widget.value,
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white,
          ),
          iconSize: 24,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: "Roboto",
            fontSize: 14,
            letterSpacing: 0.4,
            fontWeight: FontWeight.w500,
          ),
          underline: Container(color: Colors.transparent),
          dropdownColor: AppColors.purple,
          menuMaxHeight: 200,
          elevation: 0,
          onChanged: widget.onChange,
          items: widget.items,
        ),
      ),
    );
  }
}
