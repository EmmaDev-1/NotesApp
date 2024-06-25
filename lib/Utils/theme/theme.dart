import 'package:flutter/material.dart';

// light mode

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      background: Colors.white,
      primary: Colors.grey.shade300,
      secondary: Colors.grey.shade400,
      tertiary: Color.fromARGB(255, 124, 112, 255),
      inversePrimary: Colors.black,
    ));

// dark mode

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      background: Color.fromARGB(255, 40, 36, 82),
      primary: Color.fromARGB(255, 63, 57, 129),
      secondary: Color.fromARGB(255, 52, 47, 109),
      tertiary: Color.fromARGB(255, 63, 57, 129),
      inversePrimary: Colors.white,
    ));
