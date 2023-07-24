import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/design_card/select_design_page.dart';
import 'package:go_router/go_router.dart';

class Type1Card extends ConsumerWidget {
  const Type1Card(this.fullName, this.jobTitle, this.email, this.web,
      this.phone, this.mobile,
      {super.key});
  final String fullName;
  final String jobTitle;
  final String email;
  final String web;
  final String phone;
  final String mobile;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 15,
        clipBehavior: Clip.hardEdge,
        child: SizedBox(
          height: 158,
          width: 326,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(fullName),
                const Divider(
                  height: 10,
                  thickness: 2,
                  color: Colors.black,
                ),
                Text(jobTitle),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(email),
                        Text(web),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(phone),
                        Text(mobile),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
