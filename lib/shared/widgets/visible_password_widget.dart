import 'package:flutter/material.dart';

class VisibleWidget extends StatelessWidget {
  final bool visible;
  final Function()? onPressed;
  final Color? color;

  const VisibleWidget({
    Key? key,
    this.color,
    required this.visible,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        visible ? Icons.visibility_off : Icons.visibility,
        color: color,
      ),
      onPressed: onPressed,
    );
  }
}
