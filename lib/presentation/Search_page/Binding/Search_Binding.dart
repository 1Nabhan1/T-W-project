import 'package:get/get.dart';
import 'package:tw_project/presentation/Search_page/Controller/Search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => Search_controller());
  }
}
