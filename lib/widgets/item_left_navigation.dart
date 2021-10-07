import 'package:flutter/material.dart';
import 'package:flutterui_web/constant/colors.dart';
import 'package:flutterui_web/constant/styles.dart';

import 'text_primary.dart';

Widget getLeftNavigationItems(
    {required String text, required IconData icon, required Function() onTap}) {
  return Column(
    children: [
      const SizedBox(height: 16.0,),
      Icon(icon, color: MyColors.grey04, size: 18.3,),
      const SizedBox(height: 8.0,),
      TextPrimary(text: text, isCenter: true, style:MyStyles.body3.copyWith(color: MyColors.grey05)),
      const SizedBox(height: 16.0,),
    ],
  );
}
