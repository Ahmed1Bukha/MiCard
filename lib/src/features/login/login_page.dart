import 'package:business_card/src/app.dart';
import 'package:business_card/src/common_widgets/cards/type1_card.dart';
import 'package:business_card/src/common_widgets/snackbar.dart';
import 'package:business_card/src/common_widgets/textfield_custom.dart';
import 'package:business_card/src/constants/text_constants.dart';
import 'package:business_card/src/models_classes/auth.dart';
import 'package:business_card/src/models_classes/cloud_store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../common_widgets/button_full.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future loadingIndicator() async {
      showDialog(
          context: context,
          builder: (context) {
            return const Center(child: CircularProgressIndicator());
          });
    }

    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/BackGround.png"),
                fit: BoxFit.cover)),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
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
                        style: h1.copyWith(fontSize: 60),
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
                      height: 100,
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
                      height: 60,
                    ),
                    Center(
                      child: ButtonFull(
                        "Login",
                        () async {
                          if (_formKey.currentState!.validate()) {
                            loadingIndicator();
                            print("Login in has been pressed");

                            var isValid = await Auth()
                                .signInWithEmailAndPassword(
                                    emailController.text,
                                    passwordController.text);

                            if (isValid != "Email or password are wrong") {
                              final userInfoCard = await ColudStore()
                                  .readCard(isValid.user?.uid);

                              ref.read(userCard.state).state = Type1Card(
                                  userInfoCard['fullName'],
                                  userInfoCard['jobTitle'],
                                  userInfoCard['email'],
                                  userInfoCard['web'],
                                  userInfoCard['phone'],
                                  userInfoCard['mobile']);
                              Navigator.pop(context);
                              context.go('/home');
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  MySnackBar().getSnackBar(isValid));
                              Navigator.pop(context);
                            }
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
