import 'package:budget_raro/shared/themes/text_styles.dart';
import 'package:budget_raro/shared/widgets/button_widget.dart';
import 'package:budget_raro/shared/widgets/custom_app_bar_widget.dart';
import 'package:budget_raro/shared/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatefulWidget {
  final String user;
  ErrorPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        welcome: "Olá, ${widget.user}",
        drawerKey: _key,
      ),
      drawer: DrawerWidget(user: widget.user),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Erro na\nconexão",
              style: TextStyles.h3,
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 26),
            CustomButton.tentar(
              onTap: () {}, //INSERIR NAVEGAÇÃO.
            )
          ],
        ),
      ),
    );
  }
}
