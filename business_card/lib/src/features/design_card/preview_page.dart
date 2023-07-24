import 'package:business_card/src/common_widgets/button_full.dart';
import 'package:business_card/src/common_widgets/cards/type1_card.dart';
import 'package:business_card/src/constants/text_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
            ButtonFull("Generate", () {})
          ],
        )),
      ),
    );
  }
}
