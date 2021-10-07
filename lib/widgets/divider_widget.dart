import 'package:flutterui_web/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutterui_web/constant/dimens.dart';
import 'package:loading_overlay_pro/animations/bouncing_line.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(color: MyColors.divider, height: MyDimens.divider,);
  }
}
