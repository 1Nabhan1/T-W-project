import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/apiClient/Fetch_datas/Fetching_dat.dart';

class Home_controller extends GetxController {
  RxList<dynamic> datas = <dynamic>[].obs;
  final TextEditingController dataController = TextEditingController();

  void onInit() {
    super.onInit();
    fetchProductsFromApiFetchData();
  }

  Future<void> fetchProductsFromApiFetchData() async {
    try {
      final searchQuery = dataController.text;
      final fetchedProducts = await fetchAllDatas(searchQuery);
      datas.assignAll(fetchedProducts);
    } catch (e) {
      print('Error fetching products: $e');
      // Handle error here as needed
    }
  }
}
