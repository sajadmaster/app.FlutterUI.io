import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutterui_web/constant/colors.dart';
import 'package:flutterui_web/constant/dimens.dart';

class ButtonPrimary extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final double? width;
  final Color? textColor;
  final Color? backgroundColor;
  final Color? border;

  const ButtonPrimary({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width,
    this.textColor,
    this.backgroundColor,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 14.0),
      elevation: 0,

      textStyle: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'IranSans'),
      primary: backgroundColor ?? MyColors.primary,
      onPrimary: textColor ?? MyColors.onPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(MyDimen.radius),
        ),
        side: BorderSide(color: border ?? MyColors.borderPrimary, width: 1, )
      ),
    );

    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
        width: width,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
        ),
        style: style,
      ),
    );
  }
}
