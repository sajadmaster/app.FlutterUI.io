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
            return const DividerWidget();
          },
        ),
      ),
      Expanded(child: Container(color: MyColors.grey01,),)
    ],
  );
}

Widget _buildItems(MainController controller, int index) {
  ItemLeftNavigation item = controller.items[index];
  return LeftNavigationItems(
      text: item.title, icon: item.icon, onPressed: item.onPressed);
}
