import 'package:business_card/src/common_widgets/cards/type1_card.dart';
import 'package:business_card/src/models_classes/auth.dart';
import 'package:business_card/src/models_classes/cloud_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'routing/app_routing.dart';

// class MyApp extends ConsumerWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     if (Auth().checkUser() != null) {
//       ColudStore().readCard(Auth().getUserId());
//     }
//     return MaterialApp.router(
//       routerConfig: goRouter,
//     );
//   }
// }

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    print(1);
    checkUser();
    super.initState();
  }

  checkUser() async {
    final userID = await Auth().getUserId();
    print("userID");
    if (userID != null) {
      Map<String, dynamic> infoCard = await ColudStore().readCard(userID);
      ref.watch(userCard.state).state = Type1Card(
          infoCard["fullName"],
          infoCard["jobTitle"],
          infoCard["email"],
          infoCard["web"],
          infoCard["phone"],
          infoCard["mobile"]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
    );
  }
}

final userCard = StateProvider<Widget>((ref) => const Type1Card(
    "fullName", "jobTitle", "email", 'web', 'phone', ' mobile'));
