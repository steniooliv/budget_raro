import 'package:budget_raro/modules/app_widget.dart';
import 'package:budget_raro/modules/app_widget_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(ModularApp(module: AppWidgetModule(), child: AppWidget()));
}
