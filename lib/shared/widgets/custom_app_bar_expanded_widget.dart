import 'package:budget_raro/shared/themes/app_colors.dart';
import 'package:budget_raro/shared/themes/text_styles.dart';
import 'package:flutter/material.dart';

class CustomAppBarExpandedWidget extends StatefulWidget
    implements PreferredSizeWidget {
  final String transactionType;
  final GlobalKey<ScaffoldState> drawerKey;

  CustomAppBarExpandedWidget({
    Key? key,
    required this.drawerKey,
    required this.transactionType,
  })  : preferredSize = Size.fromHeight(190),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  _CustomAppBarExpandedWidgetState createState() =>
      _CustomAppBarExpandedWidgetState();
}

class _CustomAppBarExpandedWidgetState
    extends State<CustomAppBarExpandedWidget> {
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
                        Navigator.pop(context);
                        // widget.drawerKey.currentState!.openDrawer();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: AppColors.white,
                      )),
                  Spacer(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${widget.transactionType}',
                    style: TextStyles.balance,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
            ),
          ],
        ),
      ),
    );
  }
}
