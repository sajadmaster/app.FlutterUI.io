part of 'view.dart';

Widget getBody(MainController controller) {
  return Obx(() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 61,
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) => _buildItems(controller, index),
            itemCount: controller.items.length,
            separatorBuilder: (BuildContext context, int index) {
              return const DividerWidget(type: Type.horizontal);
            },
          ),
        ),
        const DividerWidget(type: Type.vertical),
        SizedBox(
          width: 260,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: InputWidget(
                  hintText: MyStrings.searchHint.tr,
                  labelText: MyStrings.searchHint.tr,
                  controller: controller.searchController,
                  suffixIcon: const Icon(
                    CupertinoIcons.search,
                    color: MyColors.icon,
                    size: MyDimens.iconSize,
                  ),
                ),
              ),
              const DividerWidget(
                type: Type.horizontal,
              ),
              ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) =>
                    _buildComponents(controller, index),
                itemCount: controller.components.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const DividerWidget(
                    type: Type.horizontal,
                  );
                },
              ),
            ],
          ),
        ),
        const DividerWidget(type: Type.vertical),
        Expanded(
          child: LayoutBuilder(builder: (context, constraints) {
            if (constraints.constrainWidth() <
                controller.initialWidth + MyDimens.canvasPadding * 2) {
              controller.deviceWidth.value =
                  constraints.constrainWidth() - MyDimens.canvasPadding * 2;
            } else {
              controller.deviceWidth.value = controller.initialWidth;
            }
            return SafeArea(
              child: Container(
                color: MyColors.grey01,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        margin: const EdgeInsets.all(MyDimens.canvasPadding),
                        width: controller.deviceWidth.value,
                        height: controller.deviceWidth.value *
                            controller.ratio.value,
                        color: MyColors.background,
                        child:  Obx((){
                          return _buildCanvas(controller.canvasItems.value);
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
        SizedBox(
          width: 320,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                width: 320,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      MyStrings.widgetType.tr,
                      style: MyStyles.body2.copyWith(color: MyColors.text),
                    ),
                    Text(
                      controller.currentWidget.value.title.toString(),
                      style: MyStyles.body2.copyWith(color: MyColors.text),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ],
    );
  });
}

Widget _buildItems(MainController controller, int index) {
  ItemLeftNavigation item = controller.items[index];
  return LeftNavigationItems(
      text: item.title, icon: item.icon, onPressed: item.onPressed);
}

Widget _buildComponents(MainController controller, int index) {
  Component item = controller.components[index];
  return CustomExpansionTile(
    title: TextPrimary(
      text: item.title.toString(),
      style: MyStyles.subtitle2.copyWith(color: MyColors.text),
    ),
    children: [
      GridView.count(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        children: List.generate(item.items.length, (index) {
          return _buildComponentItems(controller, index, item);
        }),
      )
    ],
  );
}

Widget _buildComponentItems(MainController controller, int index,
    Component component) {
  Items item = component.items[index];

  Rx<Color> borderColor = MyColors.grey01.obs;

  void _updateLocation(PointerEvent details) {
    borderColor.value = MyColors.blue02;
  }

  void _incrementExit(PointerEvent details) {
    borderColor.value = MyColors.grey01;
  }

  void _incrementEnter(PointerEvent details) {
    controller.currentWidget.value = item;
  }
  final GlobalKey _draggableKey = GlobalKey();

  return Obx(() {
    return LongPressDraggable(
      data: item,
      dragAnchorStrategy: pointerDragAnchorStrategy,
      feedback: DraggingListItem(
        dragKey: _draggableKey,
        icon: item.icon.toString(),
      ),
      child: MouseRegion(
        cursor: MouseCursor.defer,
        onEnter: _incrementEnter,
        onHover: _updateLocation,
        onExit: _incrementExit,
        child: InkWell(
          onTap: () => {},
          hoverColor: MyColors.white,
          highlightColor: MyColors.blue01,
          splashColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(MyDimens.buttonRadius),
              border: Border.all(
                color: borderColor.value,
                width: MyDimens.borderWidth,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  item.icon.toString(),
                  fit: BoxFit.contain,
                  width: 26,
                  height: 26,
                ),
                const SizedBox(
                  height: 4.0,
                ),
                TextPrimary(
                  text: item.title.toString(),
                  isCenter: true,
                  style: MyStyles.body3.copyWith(color: MyColors.grey06),
                )
              ],
            ),
          ),
        ),
      ),
    );
  });

}

Widget _buildCanvas(Items items) {
  MainController controller = Get.find();
  return DragTarget<Items>(
    builder: (context, candidateItems, rejectedItems) {
      return items.code ?? Container();
    },
    onAccept: (item) {
      if(items.type == WidgetType.main){
        print("1");
        items.child = item;
      }else if(items.type == WidgetType.none){
        print("2");
        items.code = item.code;
      }else if(items.type == WidgetType.single){
        print("3");
        items.child = item;
      }


      controller.updateCanvas();

    },
  );
}


class DraggingListItem extends StatelessWidget {
  const DraggingListItem({
    Key? key,
    required this.dragKey,
    required this.icon,
  }) : super(key: key);

  final GlobalKey dragKey;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return FractionalTranslation(
      translation: const Offset(-0.5, -0.5),
      child: ClipRRect(
        key: dragKey,
        borderRadius: BorderRadius.circular(12.0),
        child: SizedBox(
          height: 150,
          width: 150,
          child: Opacity(
            opacity: 0.85,
            child:  SvgPicture.asset(
              icon.toString(),
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ),
    );
  }
}


