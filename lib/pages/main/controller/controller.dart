import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterui_web/constant/icons.dart';
import 'package:flutterui_web/constant/images.dart';
import 'package:flutterui_web/constant/strings.dart';
import 'package:flutterui_web/pages/main/models/component.dart';
import 'package:flutterui_web/pages/main/models/item_left_navigation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MainController extends GetxController {
  RxString text = MyStrings.appName.tr.obs;
  RxList<ItemLeftNavigation> items = <ItemLeftNavigation>[].obs;
  RxList<Component> components = <Component>[].obs;
  Rx<Items> currentWidget = Items().obs;
  late TextEditingController searchController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getItems();
    getComponents();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  onSearchTextChanged(String text) async {

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

  getComponents() {
    components.clear();

    components.add(
      Component(
          title: 'Page Widgets',
          type: 'page',
          items: [
            Items(id:1, title: 'page 1',icon: MyImages.text, code:'code'),
            Items(id:2, title: 'page 1',icon: MyImages.image, code:'code'),
          ]),
    );

    components.add(
      Component(
          title: 'Base Widgets',
          type: 'base',
          items: [
            Items(id:3, title: 'Text',icon: MyImages.text, code:'code'),
            Items(id:4, title: 'Image',icon: MyImages.image, code:'code'),
            Items(id:5, title: 'Button',icon: MyImages.text, code:'code'),
          ]),
    );

  }

}
