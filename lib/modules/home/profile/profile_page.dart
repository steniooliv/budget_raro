import 'package:budget_raro/shared/widgets/base_card_widget.dart';
import 'package:budget_raro/shared/widgets/button_widget.dart';
import 'package:budget_raro/shared/widgets/custom_app_bar_expanded_widget.dart';
import 'package:budget_raro/shared/widgets/custom_textformfield_widget.dart';
import 'package:budget_raro/shared/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: DrawerWidget(),
      appBar: CustomAppBarExpandedWidget(
        transactionType: "Cadastro",
        drawerKey: _key,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: BaseCardWidget(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  CustomTextFormFieldWidget(
                    label: "Nome",
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  CustomTextFormFieldWidget(
                    label: "CPF",
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  CustomTextFormFieldWidget(
                    label: "E-mail",
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  CustomTextFormFieldWidget(
                    label: "Celular",
                  ),
                  SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomButton.salvar(
        onTap: () {},
      ),
    );
  }
}
