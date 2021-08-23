import 'package:animated_card/animated_card.dart';
import 'package:budget_raro/modules/splash/splash_controller.dart';
import 'package:budget_raro/shared/themes/app_colors.dart';
import 'package:budget_raro/shared/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashController> {
  @override
  void initState() {
    controller.hasUser();
    controller.firebaseInitialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          gradient: AppColors.linear,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            AnimatedCard(
              direction: AnimatedCardDirection.top,
              duration: Duration(seconds: 1),
              child: Stack(
                children: [
                  Positioned(
                    width: MediaQuery.of(context).size.width,
                    top: MediaQuery.of(context).size.height * 0.25,
                    child: Image.asset(
                      'assets/images/logo_splash.png',
                      height: MediaQuery.of(context).size.width / 2.4,
                    ),
                  ),
                ],
              ),
            ),
            AnimatedCard(
              direction: AnimatedCardDirection.bottom,
              duration: Duration(seconds: 1),
              child: Stack(
                children: [
                  Positioned(
                    width: MediaQuery.of(context).size.width,
                    bottom: MediaQuery.of(context).size.height * 0.07,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'powered by',
                          style: TextStyles.powered,
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Image.asset(
                          'assets/images/logo_raro_splash.png',
                          width: MediaQuery.of(context).size.width / 4.2,
                        ),
                      ],
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
