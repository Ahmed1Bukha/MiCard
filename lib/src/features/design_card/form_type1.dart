import 'package:business_card/src/common_widgets/button_full.dart';
import 'package:business_card/src/common_widgets/cards/type1_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../common_widgets/textfield_custom.dart';

class FormType1 extends ConsumerWidget {
  const FormType1({super.key});

  @override
  // I'm going crazy rn.

  Widget build(BuildContext context, WidgetRef ref) {
    final fullNameController = TextEditingController();
    final jobTitleController = TextEditingController();
    final emailController = TextEditingController();
    final webController = TextEditingController();
    final phoneController = TextEditingController();
    final mobileController = TextEditingController();

//TODO Switch to /other to all fields later ffs.
    return Form(
      child: Column(
        children: [
          CustomTextField(
              "Enter your Full name", "Full Name", fullNameController),
          CustomTextField(
              "Enter your Job Title", "Job Title", jobTitleController),
          CustomTextField("Enter your Email", "Email", emailController),
          CustomTextField("Enter your Web", "Web", webController),
          CustomTextField(
              "Enter your Phone numbe", "Phone number", phoneController),
          CustomTextField(
              "Enter your Mobile", "Mobile number", mobileController),
          ButtonFull(
            "Preview",
            () {
              print("Preview clicked");
              ref.read(type1Card.state).state = Type1Card(
                fullNameController.text,
                jobTitleController.text,
                emailController.text,
                webController.text,
                phoneController.text,
                mobileController.text,
              );

              context.go('/design/modify/preview');
            },
          )
        ],
      ),
    );
  }
}

final type1Card = StateProvider<Type1Card>((ref) => const Type1Card(
      "",
      "",
      "",
      "",
      "",
      "",
    ));
