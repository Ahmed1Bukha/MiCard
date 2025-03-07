import 'package:business_card/src/constants/text_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../common_widgets/cards/type1_card.dart';
import '../../common_widgets/cards/type2_card.dart';

class SelectDesignPage extends ConsumerWidget {
  const SelectDesignPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                "Select your Design",
                style: h1.copyWith(fontSize: 70),
                textAlign: TextAlign.center,
              ),
              GestureDetector(
                onTap: () {
                  ref.read(cardTypeProvider.state).state = 1;

                  context.go('/design/modify');
                },
                child: const Type1Card("Full Name", "Job Title", "Email", "Web",
                    "Phone", "Mobile"),
              ),
              const Type2Card()
            ],
          ),
        ),
      ),
    );
  }
}

final cardTypeProvider = StateProvider<int>((ref) => 0);
