import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tw_project/presentation/Enlarged_screen/Enlarged_screen.dart';
import 'package:tw_project/presentation/home_screen/controller/Home_controller.dart';
import 'package:tw_project/routes/All_pages/All_pages.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Home_controller home_controller = Get.put(Home_controller());
    final double screenWidth = MediaQuery.of(context).size.width;
    final int crossAxisCount = screenWidth ~/ 200;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      // CupertinoColors.systemBlue.withOpacity(0.1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 40,
        title: const Text(
          'Pixabay',
          style: TextStyle(
              color: Colors.yellow, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        backgroundColor: CupertinoColors.systemBlue.withOpacity(0.1),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            CupertinoColors.systemBlue.withOpacity(0.1),
            Colors.grey.shade900
          ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
        ),
        toolbarHeight: 90,
        actions: [
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.Searchpage);
            },
            child: const Icon(
              Icons.search,
              color: Colors.grey,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(8)),
                width: double.infinity,
                height: 40,
                child: const Row(
                  children: [
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'All Photos',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
              ),
            ),
            Obx(() {
              if (home_controller.datas.isEmpty) {
                return Column(children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .1,
                  ),
                  CircularProgressIndicator(),
                ]);
              } else {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: home_controller.datas.length,
                    physics: const BouncingScrollPhysics(),
                    addAutomaticKeepAlives: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        mainAxisExtent: 200,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5),
                    itemBuilder: (context, index) {
                      final datas = home_controller.datas[index];
                      return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: 50,
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(
                                      () => EnlargedScreen(
                                        img: datas.webformatURL!,
                                        likes: datas.likes!,
                                        comments: datas.comments!,
                                      ),
                                      transition: Transition.fadeIn,
                                      duration:
                                          const Duration(milliseconds: 500),
                                    );
                                  },
                                  child: Image.network(
                                    datas.webformatURL!,
                                    height: 150,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "${datas.likes!}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.remove_red_eye_outlined,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "${datas.views!}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ));
                    },
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
