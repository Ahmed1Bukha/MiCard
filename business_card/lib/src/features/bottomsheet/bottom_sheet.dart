import 'package:business_card/src/constants/text_constants.dart';
import 'package:flutter/material.dart';

class MyBottomSheet extends StatelessWidget {
  MyBottomSheet(this.cards, {super.key});
  List<Widget> cards;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Added Cards",
            style: h2,
          ),
          SingleChildScrollView(
              child: Column(
            children: cards,
          ))
        ],
      ),
    );
  }
}
