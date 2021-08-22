import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:budget_raro/shared/themes/app_colors.dart';
import 'package:budget_raro/shared/themes/text_styles.dart';

class DrawerWidget extends StatelessWidget {
  final String? user;
  final Function()? onTap;

  const DrawerWidget({
    Key? key,
    this.user,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 100,
            child: DrawerHeader(
              padding: EdgeInsets.zero,
              child: Container(
                decoration: BoxDecoration(gradient: AppColors.linear),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Text(
                        'Olá $user!',
                        style: TextStyles.balance,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 32.0),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Perfil',
                          style: TextStyles.drawerSection,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        GestureDetector(
                          onTap: onTap,
                          child: Text(
                            'Cadastro',
                            style: TextStyles.drawerOption,
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 1,
                color: AppColors.grey,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 32.0),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Conta',
                          style: TextStyles.drawerSection,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Feature in developemnt'),
                                content: Text(
                                    'Sorry, this feature still in development'),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Modular.to.pop();
                                      },
                                      child: Text('OK'))
                                ],
                              ),
                            );
                          },
                          child: Text(
                            'Gerenciar Cartões',
                            style: TextStyles.drawerOption,
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Feature in developemnt'),
                                content: Text(
                                    'Sorry, this feature still in development'),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Modular.to.pop();
                                      },
                                      child: Text('OK'))
                                ],
                              ),
                            );
                          },
                          child: Text(
                            'Investimentos',
                            style: TextStyles.drawerOption,
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 1,
                color: AppColors.grey,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 32.0),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Segurança',
                          style: TextStyles.drawerSection,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Alterar Senha',
                            style: TextStyles.drawerOption,
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 1,
                color: AppColors.grey,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 32.0),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Feature in developemnt'),
                                content: Text(
                                    'Sorry, this feature still in development'),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Modular.to.pop();
                                      },
                                      child: Text('OK'))
                                ],
                              ),
                            );
                          },
                          child: Text(
                            'Ajuda',
                            style: TextStyles.drawerOption,
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
