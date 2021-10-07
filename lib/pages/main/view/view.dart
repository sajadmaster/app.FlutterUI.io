import 'dart:ui';


/* MVC */
import 'package:flutter/material.dart';
import 'package:flutterui_web/constant/colors.dart';
import 'package:flutterui_web/constant/images.dart';
import 'package:flutterui_web/widgets/appbar.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';

/* PARTS */
part 'body.dart';

class View extends StatelessWidget {
  const View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<MainController>(
        initState: (state) {},
        builder: (_) {
          return Scaffold(
              backgroundColor: MyColors.bgArc,
              appBar: getAppbar(title: _.text.toString(), iconStart: MyImages.icon,),
              body: getBody(_));
        });
  }
}