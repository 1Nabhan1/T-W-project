import 'package:get/get.dart';

class Splash_bindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => Splash_bindings());
  }
}
