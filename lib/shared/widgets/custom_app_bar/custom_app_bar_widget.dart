import 'package:budget_raro/shared/themes/app_colors.dart';
import 'package:budget_raro/shared/themes/text_styles.dart';
import 'package:flutter/material.dart';

class CustomAppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final String? welcome;
  late final String? dropdownDefault;

  final GlobalKey<ScaffoldState> drawerKey;

  CustomAppBarWidget({
    Key? key,
    required this.welcome,
    required this.drawerKey,
    this.dropdownDefault,
  })  : preferredSize = Size.fromHeight(100),
        super(key: key);

  CustomAppBarWidget.maximized({
    Key? key,
    this.welcome,
    required this.drawerKey,
    required this.dropdownDefault,
  })  : preferredSize = Size.fromHeight(190),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  _CustomAppBarWidgetState createState() => _CustomAppBarWidgetState();
}

class _CustomAppBarWidgetState extends State<CustomAppBarWidget> {
  List<String> _months = [
    'JANEIRO',
    'FEVEREIRO',
    'MARÇO',
    'ABRIL',
    'MAIO',
    'JUNHO',
    'JULHO',
    'AGOSTO',
    'SETEMBRO',
    'OUTUBRO',
    'NOVEMBRO',
    'DEZEMBRO'
  ];

  late String dropdownValue = widget.dropdownDefault.toString();

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize:
          Size(MediaQuery.of(context).size.width, widget.preferredSize.height),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: AppColors.linear,
        ),
        child: widget.preferredSize.height == 100
            ? Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 24.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        IconButton(
                            onPressed: () {
                              widget.drawerKey.currentState!.openDrawer();
                            },
                            icon: Icon(
                              Icons.menu,
                              color: AppColors.white,
                            )),
                        Expanded(
                          child: Text(
                            widget.welcome.toString(),
                            style: TextStyles.h5White,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          width: 16.0,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 24.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        IconButton(
                            onPressed: () {
                              widget.drawerKey.currentState!.openDrawer();
                            },
                            icon: Icon(
                              Icons.menu,
                              color: AppColors.white,
                            )),
                        Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.white.withOpacity(0.10),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 24.0),
                            child: DropdownButton<String>(
                              dropdownColor: AppColors.purple.withOpacity(0.9),
                              menuMaxHeight:
                                  MediaQuery.of(context).size.height / 2,
                              value: dropdownValue,
                              underline: SizedBox(),
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: AppColors.white,
                              ),
                              items: _months.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyles.textButton,
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(
                                  () {
                                    dropdownValue = newValue!;
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 16.0,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'R\$ 2.000,00',
                          style: TextStyles.balance,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Entrada',
                          style: TextStyles.tabDisable,
                        ),
                        Text(
                          "|",
                          style: TextStyles.tabActive,
                        ),
                        Text(
                          'Saída',
                          style: TextStyles.tabActive,
                        ),
                        Text(
                          "|",
                          style: TextStyles.tabActive,
                        ),
                        Text(
                          'Totas',
                          style: TextStyles.tabDisable,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
