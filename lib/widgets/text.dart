import 'package:flutter/material.dart';
import 'package:flutterui_web/constant/colors.dart';

class TextPrimary extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final IconData? icon;
  final bool? isCenter;
  final TextStyle? style;

  const TextPrimary(
      {Key? key,
      required this.text,
      this.size,
      this.color,
      this.weight,
      this.icon,
      this.isCenter,
      this.style,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isCenter ?? false
          ? MainAxisAlignment.center
          : MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        icon == null
            ? const SizedBox()
            : Icon(
                icon,
                color: color,
              ),
        const SizedBox(
          width: 4.0,
        ),
        Expanded(
            child: Text(
          text,
          textAlign: isCenter ?? false ? TextAlign.center : TextAlign.start,
          style: style ?? TextStyle(
              fontSize: size ?? 20,
              color: color ?? Colors.black,
              fontWeight: weight ?? FontWeight.normal),
        )),
      ],
    );
  }
}
