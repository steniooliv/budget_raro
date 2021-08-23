import 'package:budget_raro/shared/themes/app_colors.dart';
import 'package:budget_raro/shared/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomAppBarBalanceWidget extends StatefulWidget
    implements PreferredSizeWidget {
  final String balance;

  final PageController pageController;
  final GlobalKey<ScaffoldState> drawerKey;

  final Function(String?)? onChange;
  final List<String> items;
  final String? value;

  final Function()? onTabIn;
  final Function()? onTabOut;
  final Function()? onTabAll;

  CustomAppBarBalanceWidget({
    Key? key,
    required this.drawerKey,
    required this.balance,
    required this.pageController,
    this.onChange,
    this.value,
    this.onTabIn,
    this.onTabOut,
    this.onTabAll,
    required this.items,
  })  : preferredSize = Size.fromHeight(190),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  _CustomAppBarBalanceWidgetState createState() =>
      _CustomAppBarBalanceWidgetState();
}

class _CustomAppBarBalanceWidgetState extends State<CustomAppBarBalanceWidget> {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                      onPressed: () {
                        Modular.to.navigate('/home');
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: AppColors.white,
                      )),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.10),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 24.0),
                      child: DropdownButton<String>(
                        dropdownColor: AppColors.purple.withOpacity(0.9),
                        menuMaxHeight: MediaQuery.of(context).size.height / 2,
                        value: widget.value,
                        underline: SizedBox(),
                        isDense: true,
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: AppColors.white,
                        ),
                        items: widget.items.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyles.textButton,
                            ),
                          );
                        }).toList(),
                        onChanged: widget.onChange,
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
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'R\$ ${widget.balance}',
                    style: TextStyles.balance,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: widget.onTabIn,
                    child: Text(
                      'Entrada',
                      style: widget.pageController.page == 0
                          ? TextStyles.tabActive
                          : TextStyles.tabDisable,
                    ),
                  ),
                  Text(
                    "|",
                    style: TextStyles.tabActive,
                  ),
                  InkWell(
                    onTap: widget.onTabOut,
                    child: Text(
                      'Saída',
                      style: widget.pageController.page == 1
                          ? TextStyles.tabActive
                          : TextStyles.tabDisable,
                    ),
                  ),
                  Text(
                    "|",
                    style: TextStyles.tabActive,
                  ),
                  InkWell(
                    onTap: widget.onTabAll,
                    child: Text(
                      'Todas',
                      style: widget.pageController.page == 2
                          ? TextStyles.tabActive
                          : TextStyles.tabDisable,
                    ),
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
