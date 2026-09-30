import 'package:flutter/material.dart';

abstract final class AppTextStyles {
  static const temperature = TextStyle(
    fontSize: 50,
    fontWeight: FontWeight.w700,
  );

  static const weatherCondition = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w500,
  );

  static const location = TextStyle(fontSize: 17, fontWeight: FontWeight.w400);

  static const secondary = TextStyle(fontSize: 14, fontWeight: FontWeight.w400);
}
