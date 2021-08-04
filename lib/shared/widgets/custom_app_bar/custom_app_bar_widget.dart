import 'package:budget_raro/shared/themes/app_colors.dart';
import 'package:budget_raro/shared/themes/text_styles.dart';
import 'package:flutter/material.dart';

class CustomAppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final String welcome;
  late final String dropdownDefault;

  final GlobalKey<ScaffoldState> drawerKey;

  CustomAppBarWidget({
    Key? key,
    required this.welcome,
    required this.drawerKey,
  })  : preferredSize = Size.fromHeight(100),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  _CustomAppBarWidgetState createState() => _CustomAppBarWidgetState();
}

class _CustomAppBarWidgetState extends State<CustomAppBarWidget> {
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
        ),
      ),
    );
  }
}
