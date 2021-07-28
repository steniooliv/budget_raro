import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
