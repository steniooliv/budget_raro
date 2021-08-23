import 'package:budget_raro/shared/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:budget_raro/modules/home/profile/profile_controller.dart';
import 'package:budget_raro/shared/widgets/base_card_widget.dart';
import 'package:budget_raro/shared/widgets/button_widget.dart';
import 'package:budget_raro/shared/widgets/custom_app_bar_expanded_widget.dart';
import 'package:budget_raro/shared/widgets/custom_textformfield_widget.dart';
import 'package:budget_raro/shared/widgets/drawer_widget.dart';

class ProfilePage extends StatefulWidget {
  final UserModel userModel;

  ProfilePage({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends ModularState<ProfilePage, ProfileController> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    controller.firebaseRepository.firebaseInitialize();
    controller.changeModel(widget.userModel);
    controller.populateController(widget.userModel);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Form(
        key: _formkey,
        child: Scaffold(
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
                        controller: controller.nameController,
                        label: "Nome",
                        onChanged: (text) {
                          text = controller.nameController.text;
                        },
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      CustomTextFormFieldWidget(
                        controller: controller.cpfController,
                        label: "CPF",
                        enabled: false,
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      CustomTextFormFieldWidget(
                        controller: controller.emailController,
                        label: "E-mail",
                        enabled: false,
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      CustomTextFormFieldWidget(
                        controller: controller.phoneController,
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
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: CustomButton.salvar(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
              controller.updateUser(
                name: controller.nameController.text,
                phone: controller.phoneController.text,
              );
            },
          ),
        ),
      ),
    );
  }
}
