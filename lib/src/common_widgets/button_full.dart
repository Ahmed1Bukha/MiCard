import 'package:business_card/src/constants/text_constants.dart';
import 'package:flutter/material.dart';

import '../constants/decorations_constants.dart';

class ButtonFull extends StatelessWidget {
  const ButtonFull(this.text, this.function, {super.key});
  final String text;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        alignment: Alignment.center,
        width: 206,
        height: 50,
        decoration: fullDeco,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: btnFillStyle,
        ),
      ),
    );
  }
}
