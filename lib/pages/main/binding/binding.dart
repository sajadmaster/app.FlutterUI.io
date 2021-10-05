import 'package:get/get.dart';

/* MVC */
import '../controller/controller.dart';

class Binding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(MainController());
  }

}