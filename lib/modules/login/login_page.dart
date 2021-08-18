import 'package:budget_raro/modules/login/login_controller.dart';
import 'package:budget_raro/modules/login/widget/create_account_button_widget.dart';
import 'package:budget_raro/modules/login/widget/recover_button_widget.dart';
import 'package:budget_raro/shared/themes/text_styles.dart';
import 'package:budget_raro/shared/widgets/button_widget.dart';
import 'package:budget_raro/shared/widgets/custom_textformfield_widget.dart';
import 'package:budget_raro/shared/widgets/login_button_widget.dart';
import 'package:budget_raro/shared/widgets/visible_password_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  final PageController _controller = PageController(initialPage: 0);

  void nextPage() {
    if (_controller.hasClients) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
      );
    }
  }

  void prevPage() {
    if (_controller.hasClients) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
      );
    }
  }

  void ontapAux() {}

  void toRegisterPage() {
    Navigator.pushNamed(context, '/register');
  }

  void toHomePage() {
    Navigator.pushNamed(context, '/home');
  }

  void toRecoverPage() {
    Navigator.pushNamed(context, '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _controller,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 48, right: 48),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 74,
                    ),
                    child: Image.asset(
                      "assets/images/logo_budget.png",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                    ),
                    child: Text("Vamos \ncomeçar!", style: TextStyles.h3),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                    ),
                    child: Row(children: [
                      Text(
                        "Novo usuário?",
                        style: TextStyles.body1,
                      ),
                      CreateAccountButton(onTap: toRegisterPage)
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 64,
                    ),
                    child:
                        CustomTextFormFieldWidget(label: "Insira seu e-mail"),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: CustomButton.continuar(onTap: nextPage),
                    ),
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 52),
                        child: Text(
                          "ou",
                          style: TextStyles.body,
                        ),
                      )),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 9),
                      child: LoginButton.google(
                        onTap: ontapAux,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 32),
                      child: LoginButton.facebook(onTap: ontapAux),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 48.0, right: 48),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 74,
                    ),
                    child: Image.asset(
                      "assets/images/logo_budget.png",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                    ),
                    child: Text("Insira sua \nsenha", style: TextStyles.h3),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 80,
                    ),
                    child:
                        CustomTextFormFieldWidget(label: "Insira seu e-mail"),
                  ),
                  Stack(children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                      ),
                      child: CustomTextFormFieldWidget(label: "Senha"),
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 40,
                          ),
                          child: VisibleWidget(
                              visible: false, onPressed: ontapAux),
                        )),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RecoverButton(onTap: ontapAux),
                        CustomButton.continuar(onTap: toHomePage),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
