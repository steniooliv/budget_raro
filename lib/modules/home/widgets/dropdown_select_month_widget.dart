import 'package:budget_raro/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class DropDownSelectMonthWidget extends StatefulWidget {
  const DropDownSelectMonthWidget({Key? key}) : super(key: key);

  @override
  State<DropDownSelectMonthWidget> createState() =>
      _DropDownSelectMonthWidgetState();
}

class _DropDownSelectMonthWidgetState extends State<DropDownSelectMonthWidget> {
  final Map<int, String> months = {
    1: "JAN",
    2: "FEV",
    3: "MAR",
    4: "ABR",
    5: "MAI",
    6: "JUN",
    7: "JUL",
    8: "AGO",
    9: "SET",
    10: "OUT",
    11: "NOV",
    12: "DEZ",
  };
  late String? dropdownValue =
      months[DateTime.now().month]; //months[widget.currentMonth];

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
          value: dropdownValue,
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
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: months.values.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}