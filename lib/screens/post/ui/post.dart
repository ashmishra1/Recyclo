import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recyclo/screens/post/controller/post.dart';
import 'package:recyclo/utils/shared/app_colors.dart';
import 'package:recyclo/utils/widgets/box_text.dart';

class PostScreen extends StatelessWidget {
  final String postUrl;
  const PostScreen({Key? key, required this.postUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void selectedItem(BuildContext context, item) {
      switch (item) {
        case 0:
          break;
        case 1:
          print("Privacy Clicked");
          break;
        case 2:
          print("User Logged out");

          break;
      }
    }

    PostController postController = Get.put(PostController());
    int length = 100;

    return Scaffold(
      appBar: AppBar(
        title: const BoxText.headingThree(
          'Recyclo',
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: Container(
                            child: Row(
                              children: [
                                Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          'https://midlandstraining.co.za/wp-content/uploads/2021/05/user-1.jpg'),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    BoxText.blackText('damish'),
                                    Text('somewhere_in_dark_space'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        PopupMenuButton<int>(
                          color: Colors.white,
                          onSelected: (item) => selectedItem(context, item),
                          itemBuilder: (context) => [
                            const PopupMenuItem<int>(
                              value: 0,
                              child: Text('Edit'),
                            ),
                            const PopupMenuItem<int>(
                              value: 1,
                              child: Text('Share to..'),
                            ),
                            const PopupMenuItem<int>(
                              value: 2,
                              child: Text('Delete'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          postUrl,
                        ),
                      ),
                    ),
                    width: double.infinity,
                    height: 400.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                CupertinoIcons.heart,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                CupertinoIcons.chat_bubble,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                CupertinoIcons.paperplane,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          CupertinoIcons.tag,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'damish',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Obx(() {
                            return Text.rich(TextSpan(
                              children: <InlineSpan>[
                                TextSpan(
                                    text: postController.myText.value.length >
                                                length &&
                                            !postController.showAll.value
                                        ? postController.myText
                                                .substring(0, length) +
                                            "..."
                                        : postController.myText.value),
                                postController.myText.value.length > length
                                    ? WidgetSpan(
                                        child: GestureDetector(
                                          onTap: () {
                                            postController
                                              ..showAll.value =
                                                  !postController.showAll.value;
                                          },
                                          child: Text(
                                            postController.showAll.value
                                                ? 'read less'
                                                : 'read more!',
                                            style: const TextStyle(
                                              color: kcPrimaryColor,
                                            ),
                                          ),
                                        ),
                                      )
                                    : const TextSpan(),
                              ],
                            ));
                          })
                        ]),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
