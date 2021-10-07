import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterui_web/constant/icons.dart';
import 'package:flutterui_web/constant/strings.dart';
import 'package:flutterui_web/pages/main/models/item_left_navigation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MainController extends GetxController {
  RxString text = MyStrings.appName.tr.obs;
  RxList<ItemLeftNavigation> items = <ItemLeftNavigation>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getItems();
  }

  getItems() {
    items.clear();

    items.add(
      ItemLeftNavigation(
          title: MyStrings.uiBuilder.tr,
          icon: MyIcons.chart,
          onPressed: () => null),
    );
    items.add(
      ItemLeftNavigation(
          title: MyStrings.tree.tr,
          icon: MyIcons.file_document,
          onPressed: () => null),
    );
    items.add(
      ItemLeftNavigation(
          title: MyStrings.assets.tr,
          icon: Icons.folder_open_outlined,
          onPressed: () => null),
    );
  }
}
