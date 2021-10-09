import 'package:flutterui_web/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay_pro/animations/bouncing_line.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: LoadingBouncingLine.circle(
        backgroundColor: MyColors.primary,
        borderColor: MyColors.link,
      ),
    );
  }
}
