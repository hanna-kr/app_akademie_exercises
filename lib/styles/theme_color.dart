import 'package:flutter/material.dart';

ThemeData appAkademieColor =
    ThemeData(primaryColor: const Color.fromARGB(255, 20, 54, 71));

ThemeData kButtonColor = ThemeData(
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.blueGrey)),
    ),
    buttonTheme: ButtonThemeData(buttonColor: appAkademieColor.primaryColor));
