import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_screen/controller/Home_controller.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final Search_controller search_controller = Get.put(Search_controller());
    final Home_controller home_controller = Get.put(Home_controller());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      // CupertinoColors.systemBlue.withOpacity(0.1),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .7,
                  child: TextField(
                    autofocus: true,
                    style: TextStyle(color: Colors.white),
                    controller: home_controller.dataController,
                    onTapOutside: (event) {
                      FocusScope.of(context).unfocus();
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey.shade600,
                        ),
                        hintText: 'Search here',
                        hintStyle: TextStyle(color: Colors.grey.shade600),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blueGrey, width: 2),
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(MediaQuery.of(context).size.width * .2,
                            MediaQuery.of(context).size.height * .055),
                        backgroundColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    onPressed: () async {
                      await home_controller.fetchProductsFromApiFetchData();
                      Get.back();
                    },
                    child: Icon(Icons.send))
              ],
            )
          ],
        ),
      ),
    );
  }
}
