import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutterui_web/constant/colors.dart';
import 'package:flutterui_web/constant/static_values.dart';

AppBar getAppbar(
    {required String title,
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
      style: const TextStyle(color: MyColors.black),
    ),
    leading: isBackEnable
        ? IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: MyColors.white,
              size: 20,
            ),
            onPressed: () => Get.back(result: CustomValues.onBack),
          )
        : iconStart != null
            ? FractionallySizedBox(
                heightFactor: 0.5,
                child: SvgPicture.asset(
                  iconStart,
                  fit: BoxFit.contain,
                ),
              )
            : const SizedBox(),
    actions: actions,
    elevation: 0.0,
    titleSpacing: 0.0,
    automaticallyImplyLeading: false,
  );
}
