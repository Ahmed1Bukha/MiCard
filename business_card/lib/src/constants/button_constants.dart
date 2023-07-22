import 'package:flutter/material.dart';

ShapeDecoration fullDeco = ShapeDecoration(
  color: const Color(0xFF37B286),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(17),
  ),
);

ShapeDecoration emptyDeco = ShapeDecoration(
  color: Colors.white,
  shape: RoundedRectangleBorder(
    side: const BorderSide(width: 4, color: Color(0xFF37B286)),
    borderRadius: BorderRadius.circular(17),
  ),
);
