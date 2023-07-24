import 'package:flutter/material.dart';

import '../constants/decorations_constants.dart';
import '../constants/text_constants.dart';

class ButtonBorder extends StatelessWidget {
  const ButtonBorder(this.text, this.function, {super.key});
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
        decoration: emptyDeco,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: btnEmpStyle,
        ),
      ),
    );
  }
}
