import 'package:budget_raro/shared/themes/app_colors.dart';
import 'package:budget_raro/shared/themes/text_styles.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  OnboardingPage({Key? key}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/onboarding_background.png"),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 48.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    ("assets/images/onboarding_logo.png"),
                    width: MediaQuery.of(context).size.width / 1.35,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 24,
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.65,
                    child: Text(
                      "Agora sim! Você terá o controle financeiro nas suas mãos!",
                      style: TextStyles.onboarding,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 24,
              ),
              Row(
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.cyan),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: Text(
                      "Vamos lá!",
                      style: TextStyles.textButton,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
