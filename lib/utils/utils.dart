import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutterui_web/constant/colors.dart';
import 'package:flutterui_web/constant/strings.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static void showMessage({String? title, required String message}) {
    Get.snackbar(title ?? MyStrings.appName, message,
        backgroundColor: MyColors.black..withOpacity(0.2),
        colorText: MyColors.white,
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 1));
  }

  static void launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  static sendMessage({required String phone}) async {
    // Android
    if (Platform.isAndroid) {
      var uri = 'sms:$phone';
      await launch(uri);
    } else if (Platform.isIOS) {
      // iOS
      var uri = 'sms:$phone';
      await launch(uri);
    }
  }

}
