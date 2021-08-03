import 'package:flutter/material.dart';

class BaseCardWidget extends StatelessWidget {
  
  final EdgeInsetsGeometry? margin;
  final Widget? child;
  
  const BaseCardWidget({
    Key? key,
    this.margin,
    this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: child,
      decoration:BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            spreadRadius: 0,
            blurRadius: 8,
            offset: Offset(0, 1),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.14),
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: -2,
            blurRadius: 3,
            offset: Offset(0, 3),
          ),
        ]
      )
    );
  }
}
