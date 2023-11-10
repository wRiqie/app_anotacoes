import 'package:flutter/material.dart';

final appTheme = ThemeData(
  fontFamily: 'Inter',
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    hintStyle: const TextStyle(
      color: Color(0xFFA2A2A2),
      fontSize: 14,
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(4),
    ),
  ),
);
