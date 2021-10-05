part of 'view.dart';

Widget getBody(MainController controller) {
  return ListView(
    children: [
      Text(controller.text.value)
    ],
  );
}

