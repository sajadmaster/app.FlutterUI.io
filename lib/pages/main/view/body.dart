part of 'view.dart';

Widget getBody(MainController controller) {
  return Center(
    child: Text(
      Get.width.toString(),
      style: TextStyle(fontSize: 40),
    ),
  );
}
