import 'package:get/get.dart';
import 'package:tw_project/presentation/home_screen/controller/Home_controller.dart';

class Home_binding extends Bindings {

  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => Home_controller());
  }
}