import 'package:budget_raro/modules/login/create_accounting/create_accounting_controller.dart';
import 'package:budget_raro/modules/login/create_accounting/widgets/back_button_widget.dart';
import 'package:budget_raro/shared/themes/text_styles.dart';
import 'package:budget_raro/shared/utils/filtering_formatter_textfields.dart';
import 'package:budget_raro/shared/utils/input_text_validators.dart';
import 'package:budget_raro/shared/widgets/button_widget.dart';
import 'package:budget_raro/shared/widgets/custom_textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CreateAccountingPage extends StatefulWidget {
  CreateAccountingPage({Key? key}) : super(key: key);

  @override
  _CreateAccountingPageState createState() => _CreateAccountingPageState();
}

class _CreateAccountingPageState
    extends ModularState<CreateAccountingPage, CreateAccountingController> {
  final _formKey = GlobalKey<FormState>();
  final filteringFormatter = FilteringFormatter();

  final validator = Validator();

  final PageController _controller = PageController(initialPage: 0);

  @override
  void initState() {
    controller.firebaseRepository.firebaseInitialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Form(
        key: _formKey,
        child: Scaffold(
          bottomSheet: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BackButtonWidget(onTap: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  controller.prevPage(pageController: _controller);
                }),
                Observer(builder: (_) {
                  return Text(
                    "${controller.aux}/4",
                    style: TextStyles.body2ho,
                  );
                }),
                CustomButton.continuarArrow(onTap: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  if (_formKey.currentState!.validate())
                    controller.nextPage(pageController: _controller);
                }),
              ],
            ),
          ),
          body: Padding(
            padding: EdgeInsets.only(bottom: 64.0),
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _controller,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 48, right: 48, top: 74, bottom: 16),
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
                          child: CustomTextFormFieldWidget(
                            controller: controller.name,
                            label: "Nome",
                            onChanged: (text) {
                              text = controller.name.text;
                            },
                            validator: validator.name,
                            inputFormatters: filteringFormatter.name,
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 50,
                          ),
                          child: CustomTextFormFieldWidget(
                            controller: controller.email,
                            label: "E-mail",
                            onChanged: (text) {
                              text = controller.email.text;
                            },
                            validator: validator.email,
                            inputFormatters: filteringFormatter.email,
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 48, right: 48, top: 74, bottom: 16),
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
                          child: CustomTextFormFieldWidget(
                            controller: controller.phone,
                            label: "Telefone",
                            onChanged: (text) {
                              text = controller.phone.text;
                            },
                            validator: validator.phone,
                            inputFormatters: filteringFormatter.phone,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 50,
                          ),
                          child: CustomTextFormFieldWidget(
                            controller: controller.cpf,
                            label: "CPF",
                            onChanged: (text) {
                              text = controller.cpf.text;
                            },
                            validator: validator.cpf,
                            inputFormatters: filteringFormatter.cpf,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 48, right: 48, top: 74, bottom: 16),
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
                              Observer(builder: (_) {
                                return Checkbox(
                                    checkColor: Colors.white,
                                    value: controller.isChecked,
                                    shape: CircleBorder(),
                                    onChanged: (value) {
                                      controller.isChecked = value!;
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
                  padding: const EdgeInsets.only(
                      left: 48, right: 48, top: 74, bottom: 16),
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
                            "Agora crie sua senha\ncontendo:",
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
                            child: CustomTextFormFieldWidget(
                              controller: controller.password,
                              label: "Crie uma senha",
                              onChanged: (text) {
                                text = controller.password.text;
                              },
                              obscureText: true,
                              validator: validator.password,
                              keyboardType: TextInputType.visiblePassword,
                              inputFormatters: filteringFormatter.password,
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                              top: 50,
                            ),
                            child: CustomTextFormFieldWidget(
                              controller: controller.confirmPassword,
                              label: "Confirme sua senha",
                              onChanged: (text) {
                                text = controller.confirmPassword.text;
                              },
                              obscureText: true,
                              validator: (value) {
                                if (controller.confirmPassword.text.length <
                                    8) {
                                  return "campo necessário!";
                                }
                                if (controller.password.text !=
                                    controller.confirmPassword.text) {
                                  return "as senhas não conferem!";
                                }
                              },
                              inputFormatters: filteringFormatter.password,
                              keyboardType: TextInputType.visiblePassword,
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
