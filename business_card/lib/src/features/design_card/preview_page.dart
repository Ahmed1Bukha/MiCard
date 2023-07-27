import 'package:business_card/src/app.dart';
import 'package:business_card/src/common_widgets/button_full.dart';
import 'package:business_card/src/common_widgets/cards/type1_card.dart';
import 'package:business_card/src/constants/text_constants.dart';
import 'package:business_card/src/models_classes/cloud_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'form_type1.dart';

class PreviewCardPage extends ConsumerWidget {
  const PreviewCardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //TODO: make it check which type the user picked before loading the stuff.
    Type1Card card1 = ref.watch(type1Card);
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/BackGround.png"),
              fit: BoxFit.cover),
        ),
        child: SafeArea(
            child: Column(
          children: [
            Text(
              "Preview Card",
              style: h1.copyWith(fontSize: 60),
            ),
            const SizedBox(
              height: 150,
            ),
            card1,
            const SizedBox(
              height: 200,
            ),
            ButtonFull("Generate", () {
              ColudStore().addCard(card1.fullName, card1.jobTitle, card1.email,
                  card1.web, card1.phone, card1.mobile);
              ref.read(userCard.state).state = card1;
              context.go('/home');
            })
          ],
        )),
      ),
    );
  }
}
