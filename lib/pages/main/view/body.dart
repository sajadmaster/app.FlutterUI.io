part of 'view.dart';

Widget getBody(MainController controller) {
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
        child: Container(
          color: MyColors.grey01,
        ),
      )
    ],
  );
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
        children: List.generate(item.items!.length, (index) {
          return _buildComponentItems(controller, index, item);
        }),
      )
    ],
  );
}

Widget _buildComponentItems(
    MainController controller, int index, Component component) {
  Items item = component.items![index];

  Rx<Color> borderColor = MyColors.grey01.obs;

  void _updateLocation(PointerEvent details) {
    borderColor.value = MyColors.blue02;
  }

  void _incrementExit(PointerEvent details) {
    borderColor.value = MyColors.grey01;
  }

  return Obx((){
    return MouseRegion(
      cursor: MouseCursor.defer,
      // onEnter: _incrementEnter,
      onHover: _updateLocation,
      onExit: _incrementExit,
      child: InkWell(
        onTap: ()=>{},
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
    );

  });
}


