import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tw_project/presentation/splash_screen/Splash_screen.dart';
import 'package:tw_project/presentation/splash_screen/controller/Splash_controller.dart';
import 'package:tw_project/routes/Page_routes/Pageroutes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      color: Colors.red,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      getPages: PageRoutes.List,
      home: GetBuilder<Splash_controller>(
        builder: (_) => const Splash_screen(),
        init: Splash_controller(),
      ),
    );
  }
}
