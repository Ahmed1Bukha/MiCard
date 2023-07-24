import 'package:business_card/src/common_widgets/button_border.dart';
import 'package:business_card/src/models_classes/auth.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/button_full.dart';
import '../../common_widgets/textfield_custom.dart';
import '../../constants/text_constants.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
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
                  "Welcome to the family",
                  style: h1.copyWith(fontSize: 70),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: Text(
                  textAlign: TextAlign.center,
                  "Register your account to start customizing your card",
                  style: h3,
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Center(
                child: CustomTextField(
                    "Enter Your Email", "Email", emailController),
              ),
              Center(
                child: CustomTextField(
                  "Enter Your Password",
                  "Password",
                  passwordController,
                  isPassword: true,
                ),
              ),
              Center(
                child: CustomTextField(
                  "Confirm Your Password",
                  "Confirm Password",
                  confirmPasswordController,
                  isPassword: true,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: ButtonBorder("SignUp", () async {
                  print("Email: " + emailController.text);
                  print("password: " + passwordController.text);
                  var res = await Auth().registerWithEmailAndPassword(
                      emailController.text, passwordController.text);
                  print(res);
                  if (res == "Done") {
                    context.go('/design');
                  }
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
