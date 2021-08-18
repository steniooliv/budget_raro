import 'package:budget_raro/modules/login/create_accounting/create_accouting_controller.dart';
import 'package:budget_raro/modules/login/create_accounting/widgets/back_button_widget.dart';
import 'package:budget_raro/shared/themes/text_styles.dart';
import 'package:budget_raro/shared/widgets/button_widget.dart';
import 'package:budget_raro/shared/widgets/custom_textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CreateAccountingPage extends StatefulWidget {
  CreateAccountingPage({Key? key}) : super(key: key);

  @override
  _CreateAccountingPageState createState() => _CreateAccountingPageState();
}

class _CreateAccountingPageState
    extends ModularState<CreateAccountingPage, CreateAccountingController> {
  final PageController _controller = PageController(initialPage: 0);
  int aux = 1;
  bool isChecked = false;
  void nextPage() {
    if (_controller.hasClients &&
        _controller.page != 3 &&
        _controller.page != 2) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
      );
      aux++;
    }
    if (_controller.hasClients && _controller.page == 2 && isChecked == true) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
      );
      aux++;
    }
    if (_controller.page == 3) {
      Navigator.pushNamed(context, '/onboarding');
      aux = 1;
    }
    setState(() {});
  }

  void prevPage() {
    if (_controller.hasClients && _controller.page != 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
      );
      aux--;
    }
    if (_controller.page == 0) {
      Navigator.pop(context);
      aux = 1;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BackButtonWidget(onTap: prevPage),
            Text(
              "$aux/4",
              style: TextStyles.body2ho,
            ),
            CustomButton.continuarArrow(onTap: nextPage),
          ],
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _controller,
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(left: 48, right: 48, top: 74, bottom: 16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/logo_budget.png",
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                    ),
                    child: Text("Bem-vindo!", style: TextStyles.h3),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                    ),
                    child: Row(children: [
                      Text(
                        "Por favor insira seus dados\nno campos abaixo.",
                        style: TextStyles.h6,
                      ),
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 110,
                    ),
                    child: CustomTextFormFieldWidget(label: "Nome"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 50,
                    ),
                    child: CustomTextFormFieldWidget(label: "E-mail"),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 48, right: 48, top: 74, bottom: 16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/logo_budget.png",
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                    ),
                    child: Text("Bem-vindo!", style: TextStyles.h3),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                    ),
                    child: Text(
                      "Mais alguns dados.",
                      style: TextStyles.h6,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 145,
                    ),
                    child: CustomTextFormFieldWidget(label: "Telefone"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 50,
                    ),
                    child: CustomTextFormFieldWidget(label: "CPF"),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 48, right: 48, top: 74, bottom: 16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/logo_budget.png",
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                    ),
                    child: Text("Bem-vindo!", style: TextStyles.h3),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                    ),
                    child: Text(
                      "Leia com atenção e aceite.",
                      style: TextStyles.h6,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 44,
                    ),
                    child: Text(
                      "Lorem Ipsum neque porro quisquam est\nqui dolorem ipsum quia dolor sit amet,\nconsectetur, adipisci velit. Ipsum neque\nporro quisquam est qui dolorem ipsum\nquia dolor sit amet, consectetur, adipisci\nvelit. Nque porro  est qui dolorem ipsum\nquia dolor sit amet, , adipisci velit.\nQuisquam est qui dolorem ipsum.",
                      style: TextStyles.body1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Row(
                      children: [
                        Checkbox(
                            checkColor: Colors.white,
                            value: isChecked,
                            shape: CircleBorder(),
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            }),
                        Text(
                          "Eu li e aceito os termos e condições\ne a Política de privacidade do budget.",
                          style: TextStyles.body1,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 48, right: 48, top: 74, bottom: 16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/logo_budget.png",
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                    ),
                    child: Text("Bem-vindo!", style: TextStyles.h3),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                    ),
                    child: Text(
                      "Agora crie sua senha\nConteudo:",
                      style: TextStyles.h6,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "• pelo menos oito caracteres\n• letras maiúsculas,\n  letras minúsculas, números e símbolos",
                            style: TextStyles.body1,
                          ),
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 50,
                    ),
                    child: CustomTextFormFieldWidget(label: "Crie uma senha"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 50,
                    ),
                    child:
                        CustomTextFormFieldWidget(label: "Confirme sua senha"),
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
