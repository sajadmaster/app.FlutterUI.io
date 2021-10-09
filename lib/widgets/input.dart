import 'package:flutter/material.dart';
import 'package:flutterui_web/constant/styles.dart';
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
  final Widget? prefixIcon;
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
    this.prefixIcon,
    this.autovalidateMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: MyColors.icon,
      keyboardType: keyboardType ?? TextInputType.text,
      textInputAction: textInputAction ?? TextInputAction.next,
      obscureText: obscureText ?? false,
      controller: controller,
      autovalidateMode: autovalidateMode ?? AutovalidateMode.onUserInteraction,
      onSaved: onSaved,
      validator: validator,
      decoration: InputDecoration(
        labelStyle: MyStyles.body2.copyWith(
          color: MyColors.grey04,
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 0.0, horizontal: 12.0),
        isDense: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              MyDimens.buttonRadius,
            ),
            borderSide: const BorderSide(
              color: MyColors.grey01,
              width: MyDimens.borderWidth,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              MyDimens.buttonRadius,
            ),
            borderSide: const BorderSide(
              color: MyColors.border,
              width: MyDimens.borderWidth,
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              MyDimens.buttonRadius,
            ),
            borderSide: const BorderSide(
              color: MyColors.grey01,
              width: MyDimens.borderWidth,
            )),
        filled: true,
        fillColor: Colors.transparent,
        hintStyle: MyStyles.body2.copyWith(
          color: MyColors.grey04,
        ),
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
