import 'package:flutter/material.dart';
import 'package:flutterui_web/constant/colors.dart';

final ThemeData appThemeDataLight = ThemeData(
  primaryColor: MyColors.primary,
  splashColor: MyColors.primary,
  highlightColor: MyColors.primary,
  backgroundColor: Colors.white,
  fontFamily: 'Manrope',
  brightness: Brightness.light,
  primarySwatch: createMaterialColor(MyColors.primary),
  colorScheme: const ColorScheme.light(
    primary: MyColors.primary,
    primaryVariant: MyColors.primary,
    secondary: MyColors.secondary,
    secondaryVariant: Color(0xff018786),
    surface: Colors.red,
    background: Colors.white,
    error: MyColors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurface: Colors.black,
    onBackground: Colors.black,
    onError: Colors.white,
    brightness: Brightness.light,
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
  ),
);

final ThemeData appThemeDataDark = ThemeData(
  primaryColor: MyColors.primary,
  splashColor: MyColors.primary,
  highlightColor: MyColors.primary,
  backgroundColor: Colors.black,
  cardColor: Colors.black,
  fontFamily: 'Manrope',
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: Color(0xffbb86fc),
    primaryVariant: Color(0xff3700B3),
    secondary: Color(0xff03dac6),
    secondaryVariant: Color(0xff03dac6),
    surface: Color(0xff121212),
    background: Color(0xff121212),
    error: Color(0xffcf6679),
    onPrimary: Colors.black,
    onSecondary: Colors.black,
    onSurface: Colors.white,
    onBackground: Colors.white,
    onError: Colors.black,
    brightness: Brightness.dark,
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
  ),
);
