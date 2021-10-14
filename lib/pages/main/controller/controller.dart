import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterui_web/constant/colors.dart';
import 'package:flutterui_web/constant/icons.dart';
import 'package:flutterui_web/constant/images.dart';
import 'package:flutterui_web/constant/strings.dart';
import 'package:flutterui_web/pages/main/models/component.dart';
import 'package:flutterui_web/pages/main/models/item_left_navigation.dart';
import 'package:flutterui_web/pages/main/view/view.dart';
import 'package:flutterui_web/widgets/button.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MainController extends GetxController {
  RxString text = MyStrings.appName.tr.obs;
  RxDouble ratio = 2.165333333.obs;
  double initialWidth = 375.0;
  RxDouble deviceWidth = 375.0.obs;

  RxList<ItemLeftNavigation> items = <ItemLeftNavigation>[].obs;
  RxList<Component> components = <Component>[].obs;
  Rx<Items> currentWidget = Items().obs;
  late TextEditingController searchController;

  Rx<Items> canvasItems = Items().obs;
  RxInt count = 0.obs;

  // Rx<Items> body = Items().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // body.value = Items(
    //     id: 2,
    //     type: WidgetType.single,
    //     title: 'Text',
    //     icon: MyImages.text,);
    // body.value.code = Container(
    //   width: 200,
    //   height: 200,
    //   color: Colors.blue,
    //   child: (body.value.child?.code == null ) ? Text("sa") : Text("sasa"),
    //   // child: widget.value,
    // );

    canvasItems.value = Items(
      id: 3,
      type: WidgetType.main,
      title: 'Scaffold',
      icon: MyImages.text,
    );

    updateCanvas();

    getItems();
    getComponents();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  onSearchTextChanged(String text) async {}

  updateCanvas() {
    canvasItems.value.code = Scaffold(
      backgroundColor: Colors.red,
      // body: canvasItems.value.child?.code ?? Text("Hello World")
      body: canvasItems.value.child == null
          ? Text("hollo")
          : buildCanvas(canvasItems.value.child ?? Items()),
    );
    count.value++;

    if (count.value > 2) {
      print("--------------------");
      print(canvasItems.value.child);
      print("--------------------");
    }
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
      Component(title: 'Page Widgets', type: 'page', items: [
        Items(
            id: 1,
            type: WidgetType.single,
            title: 'page 1',
            icon: MyImages.text,
            code: Container(
              color: Colors.blue,
              height: 100,
              width: 100,
            )),
        Items(
            id: 2,
            type: WidgetType.single,
            title: 'page 1',
            icon: MyImages.image,
            code: Container(
              color: MyColors.green01,
            )),
      ]),
    );

    components.add(Component(title: 'Base Widgets', type: 'base', items: [
      Items(
          id: 3,
          type: WidgetType.none,
          title: 'Text',
          icon: MyImages.text,
          code: Text("Text1")),
      Items(
          id: 4,
          type: WidgetType.single,
          title: 'Text',
          icon: MyImages.image,
          code: SvgPicture.asset(
            MyStrings.download,
            height: 24,
            width: 24,
          )),
      Items(
          id: 5,
          type: WidgetType.single,
          title: 'Button',
          icon: MyImages.text,
          code: ButtonWidget(
            text: 'Button1',
            onPressed: () => {},
          )),
      Items(
        id: 5,
        type: WidgetType.single,
        title: 'Container',
        icon: MyImages.text,
        code: Container(
          width: 50,
          height: 50,
          color: Colors.yellow,
        ),
      ),
    ]));
  }
}
