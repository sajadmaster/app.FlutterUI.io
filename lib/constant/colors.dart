import 'package:flutter/material.dart';

class MyColors {
  static const Color white = Color.fromRGBO(255, 255, 255, 1);
  static const Color black = Color.fromRGBO(0, 0, 0, 1.0);
  static const header =  Color(0xFFFFFFFF);
  static const primary =  Color(0xFFFCD535);
  static const textPrimary =  Color(0xFFF1C204);
  static const onPrimary =  Color(0xFF1E2329);
  static const borderPrimary =  Color(0xFFF1C204);
  static const background =  Color(0xFFE5E5E5);

  static const red =  Color(0xFFEE6055);
  static const error =  Color(0xFFB00020);
  static const link =  Color(0xFFF1C204);
  static const success =  Color(0xFF0AA450);
  static const divider =  Color(0xFFE4E5E5);
  static const subTitle =  Color(0xFF4F5661);
  static const desc =  Color(0xFF7C8799);
  static const desc2 =  Color(0xFFB3B4B6);
  static const bgArc =  Color(0xFFF5F5F5);

  static const secondary =  Color(0xFFEAEBEB);
  static const onSecondary =  Color(0xFF4F5661);
  static const borderSecondary =  Color(0xFFB3B4B6);

  static const disable =  Color(0xFFF5F5F7);
  static const bgBottomNavigation =  Color(0xFFFFFFFF);
  static const unselectedItemColor =  Color(0xFF6E6E6E);


  static const text =  Color(0xff000000);


}




MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  final swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}
