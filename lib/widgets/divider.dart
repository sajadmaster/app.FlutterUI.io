import 'package:flutterui_web/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutterui_web/constant/dimens.dart';
import 'package:loading_overlay_pro/animations/bouncing_line.dart';

class DividerWidget extends StatelessWidget {
  final Type type;

  const DividerWidget({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return type == Type.horizontal
        ? const Divider(
            color: MyColors.divider,
            thickness: MyDimens.divider,
            height: MyDimens.divider,
          )
        : const VerticalDivider(
            color: MyColors.divider,
            thickness: MyDimens.divider,
            width: MyDimens.divider,
          );
  }
}

enum Type { vertical, horizontal }
