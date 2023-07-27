import 'package:business_card/src/constants/text_constants.dart';
import 'package:flutter/material.dart';

class MySnackBar {
  getSnackBar(String text) {
    return SnackBar(
      action: SnackBarAction(
        label: "Ok",
        onPressed: () {},
        textColor: Colors.white,
      ),
      backgroundColor: Colors.red,
      content: Center(
        child: Row(
          children: [
            Text(
              text,
              style: h3.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
