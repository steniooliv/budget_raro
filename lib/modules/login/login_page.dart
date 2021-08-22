import 'package:budget_raro/modules/login/login_controller.dart';
import 'package:budget_raro/modules/login/widget/create_account_button_widget.dart';
import 'package:budget_raro/modules/login/widget/recover_button_widget.dart';
import 'package:budget_raro/shared/themes/text_styles.dart';
import 'package:budget_raro/shared/utils/filtering_formatter_textfields.dart';
import 'package:budget_raro/shared/widgets/button_widget.dart';
import 'package:budget_raro/shared/widgets/custom_textformfield_widget.dart';
import 'package:budget_raro/shared/widgets/login_button_widget.dart';
import 'package:budget_raro/shared/widgets/visible_password_widget.dart';
import 'package:budget_raro/shared/utils/input_text_validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  void initState() {
    controller.firebaseInitialize().then((value) =>
        WidgetsFlutterBinding.ensureInitialized()
            .addPostFrameCallback((timeStamp) {}));
    controller.firebaseRepository.firebaseInitialize();
    super.initState();
  }
  final validator = Validator();
  final filteringFormatter = FilteringFormatter();
  bool passwordObscure = true;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Form(
        key: controller.formKey,
        child: Scaffold(
          body: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: controller.pageController,
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
                          CreateAccountButton(onTap: controller.toRegisterPage)
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 64,
                        ),
                        child:
                            CustomTextFormFieldWidget(
                              controller: controller.email,
                              label: "Insira seu e-mail",
                              onChanged: (value) => controller.email.text,
                              validator: validator.email,
                              inputFormatters: filteringFormatter.email,
                              keyboardType: TextInputType.emailAddress,
                            ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: CustomButton.continuar(onTap: controller.nextPage),
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
                            onTap: controller.ontapAux,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 32),
                          child: LoginButton.facebook(onTap: controller.ontapAux),
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
                          CustomTextFormFieldWidget(
                            controller: controller.email,
                            label: "E-mail",
                            onChanged: (value) => controller.email.text,
                            validator: validator.email,
                            inputFormatters: filteringFormatter.email,
                            keyboardType: TextInputType.emailAddress,
                          ),
                      ),
                      Stack(children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 30,
                          ),
                          child: 
                            CustomTextFormFieldWidget(
                              controller: controller.password,
                              label: "Senha",
                              obscureText: passwordObscure,
                              onChanged: (value) => controller.password.text,
                              validator: validator.password,
                              inputFormatters: filteringFormatter.password,
                              keyboardType: TextInputType.visiblePassword,
                            ),
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 40,
                              ),
                              child: VisibleWidget(
                                  visible: passwordObscure,
                                  onPressed: () {
                                    setState(() {
                                      passwordObscure = !passwordObscure;
                                    });
                                  }
                              ),
                            )
                        ),
                      ]),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RecoverButton(onTap: controller.ontapAux),
                            CustomButton.continuar(onTap: controller.toHomePage),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

