import 'package:business_card/src/common_widgets/textfield_custom.dart';
import 'package:business_card/src/constants/text_constants.dart';
import 'package:business_card/src/models_classes/auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common_widgets/button_full.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  context.go('/');
                },
                child: Icon(
                  Icons.close,
                  size: 40,
                ),
              ),
              Center(
                child: Text(
                  "Hello again!",
                  style: h1.copyWith(fontSize: 70),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: Text(
                  textAlign: TextAlign.center,
                  "Enter your email and passord to get you going",
                  style: h3,
                ),
              ),
              const SizedBox(
                height: 200,
              ),
              Center(
                  child: CustomTextField(
                      "Enter Your Email", "Email", emailController)),
              Center(
                child: CustomTextField(
                  "Enter Your Password",
                  "Password",
                  passwordController,
                  isPassword: true,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: ButtonFull(
                  "Login",
                  () async {
                    print("Login in has been pressed");

                    var isValid = await Auth().signInWithEmailAndPassword(
                        emailController.text, passwordController.text);
                    print(isValid);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
