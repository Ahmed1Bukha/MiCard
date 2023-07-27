import 'package:business_card/src/constants/text_constants.dart';
import 'package:business_card/src/features/design_card/form_type1.dart';
import 'package:business_card/src/features/design_card/select_design_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DesignCardPage extends ConsumerWidget {
  const DesignCardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int cardtype = ref.watch(cardTypeProvider);
    print(cardtype);
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/BackGround.png"),
              fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "Enter your info",
                    style: h1.copyWith(fontSize: 50),
                    textAlign: TextAlign.center,
                  ),
                  FormType1()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
