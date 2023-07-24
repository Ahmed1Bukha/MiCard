import 'package:flutter/material.dart';

import '../constants/decorations_constants.dart';
import '../constants/text_constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(this.hintText, this.labelText, this.myController,
      {super.key, this.isPassword = false});

  final String hintText;
  final String labelText;
  final TextEditingController myController;
  final bool isPassword;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text(
                  labelText,
                  textAlign: TextAlign.center,
                  style: h4,
                ),
              ],
            ),
            TextField(
              controller: myController,
              obscureText: isPassword,
              decoration: textFieldStyle.copyWith(
                hintText: hintText,
                hintStyle: hintStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
