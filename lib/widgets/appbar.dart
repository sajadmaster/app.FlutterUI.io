import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutterui_web/constant/colors.dart';
import 'package:flutterui_web/constant/static_values.dart';

AppBar getAppbar({required String title,
  required bool isBackEnable,
  IconData? icon,
  String? iconStart,
  Function()? onPressed,
  List<Widget>? actions}) {
  return AppBar(
    centerTitle: false,
    backgroundColor: MyColors.header,
    title: Text(
        title,
        textAlign: TextAlign.start,
        style: const TextStyle(
            color: const Color(0xff414141),
            fontWeight: FontWeight.w600,
            fontFamily: "Manrope",
            fontStyle: FontStyle.normal,
            fontSize: 24.0
        ),
    ),
    leadingWidth: 56,
    leading: iconStart == null
        ? const SizedBox()
        : Container(
      margin: const EdgeInsets.only(left: 16.0),
      child: SvgPicture.asset(
        iconStart,
        fit: BoxFit.contain,
      ),
    ),
    actions: actions,
    elevation: 0.0,
    titleSpacing: 0.0,
    automaticallyImplyLeading: false,
  );
}
