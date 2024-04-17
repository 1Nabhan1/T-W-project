import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tw_project/presentation/splash_screen/controller/Splash_controller.dart';

class Splash_screen extends GetView<Splash_controller> {
  const Splash_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.withOpacity(0.11),
      body: Center(
        child: Image.asset('assets/Splash.gif'),
      ),
    );
  }
}
