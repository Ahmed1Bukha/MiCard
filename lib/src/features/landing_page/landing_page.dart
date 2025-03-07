import 'package:business_card/src/common_widgets/button_border.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../common_widgets/button_full.dart';
import '../../constants/text_constants.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/BackGround.png"),
                fit: BoxFit.cover)),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: 'MiCard\n', style: h1),
                      TextSpan(text: '📇', style: iconStyle),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 200,
              ),
              Text(
                'Share your business card digitaly with MiCard',
                textAlign: TextAlign.center,
                style: h2,
              ),
              const SizedBox(
                height: 70,
              ),
              ButtonFull(
                "Login",
                () {
                  context.go('/login');
                  print("Clicked LogIn");
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonBorder("Sign Up", () {
                context.go('/register');
                print("Sign Up clicked");
              })
            ],
          ),
        ),
      ),
    );
  }
}
