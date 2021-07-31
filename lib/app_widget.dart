import 'package:budget_raro/modules/create/create_page.dart';
import 'package:budget_raro/modules/edit/edit_page.dart';
import 'package:budget_raro/modules/error/error_page.dart';
import 'package:budget_raro/modules/home/home_page.dart';
import 'package:budget_raro/modules/login/login_page.dart';
import 'package:budget_raro/modules/profile/profile_page.dart';
import 'package:budget_raro/modules/register/register_page.dart';
import 'package:budget_raro/modules/splash/splash_page.dart';
import 'package:budget_raro/modules/transactions/transactions_page.dart';
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
      initialRoute: "/",
      routes: {
        "/": (context) => SplashPage(),
        "/login": (context) => LoginPage(),
        "/register": (context) => RegisterPage(),
        "/home": (context) => HomePage(),
        "/error": (context) => ErrorPage(),
        "/transactions": (context) => TransactionsPage(),
        "/create": (context) => CreatePage(),
        "/edit": (context) => EditPage(),
        "/profile": (context) => ProfilePage(),
      },
    );
  }
}
