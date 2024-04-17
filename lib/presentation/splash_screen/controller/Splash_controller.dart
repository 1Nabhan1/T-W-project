import 'dart:async';

import 'package:get/get.dart';
import 'package:tw_project/routes/All_pages/All_pages.dart';

class Splash_controller extends GetxController {
  @override
  void onInit() {
    Timer(const Duration(seconds: 5), () {
      Get.offNamed(AppRoutes.Homepage);
    });
    super.onInit();
  }
}
