import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterui_web/constant/dimens.dart';
import 'package:flutterui_web/constant/strings.dart';
import 'package:flutterui_web/constant/styles.dart';
import 'package:get/get.dart';
import 'package:flutterui_web/constant/colors.dart';

import 'button.dart';

AppBar getAppbar({required String title,
  IconData? icon,
  String? iconStart,
  Function()? onPressed,
  List<Widget>? actions}) {
  return AppBar(
    shape: const Border(bottom: BorderSide(color: MyColors.divider, width: MyDimens.divider)),
    centerTitle: false,
    backgroundColor: MyColors.header,
    title: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
            title,
            textAlign: TextAlign.start,
            style: MyStyles.h5.copyWith(color: MyColors.grey06),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: MyDimens.marginHorizontal1),
          child: ButtonWidget(text: MyStrings.download.tr, onPressed: () {  }, icon: const Icon(CupertinoIcons.cloud_download_fill, color: MyColors.icon,),),
        )
      ],
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
