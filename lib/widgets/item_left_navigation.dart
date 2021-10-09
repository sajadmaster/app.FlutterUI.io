import 'package:flutter/material.dart';
import 'package:flutterui_web/constant/colors.dart';
import 'package:flutterui_web/constant/styles.dart';
import 'package:get/get.dart';

import 'text.dart';

class LeftNavigationItems extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function() onPressed;

  LeftNavigationItems({
    Key? key,
    required this.text,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  Rx<Color> textColor = MyColors.grey05.obs;
  Rx<Color> iconColor = MyColors.grey04.obs;
  Rx<TextStyle> style = MyStyles.body3.copyWith(color: MyColors.grey05).obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return MouseRegion(
        cursor: MouseCursor.defer,
        // onEnter: _incrementEnter,
        onHover: _updateLocation,
        onExit: _incrementExit,
        child: MaterialButton(
            onPressed: onPressed,
            hoverColor: MyColors.blue01,
            child: Column(
              children: [
                const SizedBox(
                  height: 16.0,
                ),
                Icon(
                  icon,
                  color: iconColor.value,
                  size: 18.3,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextPrimary(text: text, isCenter: true, style: style.value),
                const SizedBox(
                  height: 16.0,
                ),
              ],
            )
        ),
      );
    });
  }

  void _updateLocation(PointerEvent details) {
    textColor.value = MyColors.blue05;
    iconColor.value = MyColors.blue05;
    style.value = MyStyles.hover.copyWith(color: textColor.value);
  }

  void _incrementExit(PointerEvent details) {
    textColor.value = MyColors.grey05;
    iconColor.value = MyColors.grey04;
    style.value = MyStyles.body3.copyWith(color: MyColors.grey05);
  }
}
