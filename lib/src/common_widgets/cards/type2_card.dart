import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/design_card/select_design_page.dart';
import 'package:go_router/go_router.dart';

class Type2Card extends ConsumerWidget {
  const Type2Card({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          ref.read(cardTypeProvider.state).state = 2;

          context.go('/design/modify');
        },
        child: const Card(
          elevation: 15,
          clipBehavior: Clip.hardEdge,
          child: SizedBox(
            height: 158,
            width: 326,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Full Name"),
                  Divider(
                    height: 10,
                    thickness: 2,
                    color: Colors.blue,
                  ),
                  Text("Job title"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text("Email/Other"),
                          Text("Web/Other"),
                        ],
                      ),
                      Column(
                        children: [
                          Text("Phone/Other"),
                          Text("Mobile/Other"),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
