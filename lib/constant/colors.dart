import 'package:flutter/material.dart';

class MyColors {
  static const Color white = Color.fromRGBO(255, 255, 255, 1);
  static const Color black = Color.fromRGBO(0, 0, 0, 1.0);
  static const header = Color(0xFFFFFFFF);
  static const primary = Color(0xFFFCD535);
  static const textPrimary = Color(0xFFF1C204);
  static const onPrimary = Color(0xFF1E2329);

  static const red = Color(0xFFEE6055);
  static const error = Color(0xFFB00020);
  static const link = Color(0xFFF1C204);
  static const success = Color(0xFF0AA450);
  static const subTitle = Color(0xFF4F5661);
  static const desc = Color(0xFF7C8799);
  static const desc2 = Color(0xFFB3B4B6);
  static const bgArc = Color(0xFFF5F5F5);

  static const secondary = Color(0xFFEAEBEB);
  static const onSecondary = Color(0xFF4F5661);
  static const borderSecondary = Color(0xFFB3B4B6);

  static const disable = Color(0xFFF5F5F7);
  static const bgBottomNavigation = Color(0xFFFFFFFF);
  static const unselectedItemColor = Color(0xFF6E6E6E);

  static const text = Color(0xff000000);
  static const border = grey05;
  static const divider = grey01;
  static const background = Color(0xFFFFFFFF);
  static const icon = grey05;

  static const grey01 = Color(0xffe0e0e0);
  static const grey02 = Color(0xffc0c0c0);
  static const grey03 = Color(0xffa1a1a1);
  static const grey04 = Color(0xff818181);
  static const grey05 = Color(0xff616161);
  static const grey06 = Color(0xff414141);

  static const pink01 = Color(0xfffac1d6);
  static const pink02 = Color(0xfff584ad);
  static const pink03 = Color(0xfff04684);
  static const pink04 = Color(0xffe1125e);
  static const pink05 = Color(0xffa90e46);
  static const pink06 = Color(0xff70092f);

  static const red01 = Color(0xfffcd0cf);
  static const red02 = Color(0xfffaa09e);
  static const red03 = Color(0xfff7716e);
  static const red04 = Color(0xfff5413d);
  static const red05 = Color(0xffda100b);
  static const red06 = Color(0xff910b08);

  static const orange01 = Color(0xfffbe5c9);
  static const orange02 = Color(0xfff6ca92);
  static const orange03 = Color(0xfff2b05c);
  static const orange04 = Color(0xffed9526);
  static const orange05 = Color(0xffbf710f);
  static const orange06 = Color(0xff7f4c0a);

  static const yellow01 = Color(0xfffbf3d0);
  static const yellow02 = Color(0xfff7e7a1);
  static const yellow03 = Color(0xfff4db71);
  static const yellow04 = Color(0xfff0d042);
  static const yellow05 = Color(0xffd4b011);
  static const yellow06 = Color(0xff8e750b);

  static const green01 = Color(0xffc5f2c7);
  static const green02 = Color(0xff8ce590);
  static const green03 = Color(0xff52d858);
  static const green04 = Color(0xff2ab930);
  static const green05 = Color(0xff1f8b24);
  static const green06 = Color(0xff155d18);

  static const teal01 = Color(0xffabfbf2);
  static const teal02 = Color(0xff4ef6e5);
  static const teal03 = Color(0xff0cdac6);
  static const teal04 = Color(0xff009e8e);
  static const teal05 = Color(0xff00776a);
  static const teal06 = Color(0xff004f47);

  static const blue01 = Color(0xffc5dcfa);
  static const blue02 = Color(0xff8ab9f6);
  static const blue03 = Color(0xff5096f1);
  static const blue04 = Color(0xff1672ec);
  static const blue05 = Color(0xff0f56b3);
  static const blue06 = Color(0xff0a3977);

  static const indigo01 = Color(0xffc7cdf1);
  static const indigo02 = Color(0xff8e9ae3);
  static const indigo03 = Color(0xff5668d5);
  static const indigo04 = Color(0xff2e41b6);
  static const indigo05 = Color(0xff223189);
  static const indigo06 = Color(0xff17205b);

  static const purple01 = Color(0xffecb9f9);
  static const purple02 = Color(0xffd972f4);
  static const purple03 = Color(0xffc52cee);
  static const purple04 = Color(0xff9a0fbf);
  static const purple05 = Color(0xff730c8f);
  static const purple06 = Color(0xff4d085f);
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
