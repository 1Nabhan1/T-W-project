import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnlargedScreen extends StatelessWidget {
  final String img;
  final int likes;
  final int comments;

  const EnlargedScreen({
    super.key,
    required this.img,
    required this.likes,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: CupertinoColors.systemBlue.withOpacity(0.1),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios_sharp,
                color: Colors.white,
              )),
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: GestureDetector(
          onVerticalDragEnd: (details) {
            if (details.primaryVelocity! > 0) {
              // Swiped down
              Get.back();
            }
          },
          child: Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.vertical,
            background: Container(color: Colors.transparent),
            onDismissed: (_) {
              Get.back();
            },
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    img,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          size: 30,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${likes}",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.mode_comment_outlined,
                          size: 30,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${comments}",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
