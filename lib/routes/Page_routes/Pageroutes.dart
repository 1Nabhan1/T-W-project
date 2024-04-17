import 'package:get/get.dart';
import 'package:tw_project/presentation/Search_page/Binding/Search_Binding.dart';
import 'package:tw_project/presentation/Search_page/Search_page.dart';
import 'package:tw_project/presentation/home_screen/Home_screen.dart';
import 'package:tw_project/presentation/home_screen/binding/Home_binding.dart';
import 'package:tw_project/routes/All_pages/All_pages.dart';

class PageRoutes {
  static var List = [
    GetPage(
        name: AppRoutes.Homepage,
        page: () => const HomeScreen(),
        binding: Home_binding()),
    GetPage(
        name: AppRoutes.Searchpage,
        page: () => SearchPage(),
        binding: SearchBinding())
  ];
}
