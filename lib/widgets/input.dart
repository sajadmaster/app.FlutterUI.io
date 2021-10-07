import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutterui_web/constant/colors.dart';
import 'package:flutterui_web/constant/dimens.dart';

class InputWidget extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final Color? backgroundColor;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool? obscureText;
  final Widget? suffixIcon;
  final AutovalidateMode? autovalidateMode;


  const InputWidget({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.onSaved,
    this.validator,
    this.backgroundColor,
    this.keyboardType,
    this.textInputAction,
    this.obscureText,
    this.suffixIcon,
    this.autovalidateMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType ?? TextInputType.text,
      textInputAction: textInputAction ?? TextInputAction.next,
      obscureText: obscureText ?? false,
      controller: controller,
      autovalidateMode: autovalidateMode ?? AutovalidateMode.onUserInteraction,
      onSaved: onSaved,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: MyColors.black, fontSize: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(MyDimens.radius),
        ),
        filled: true,
        fillColor: Colors.transparent,
        hintStyle: const TextStyle(color: MyColors.desc),
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
