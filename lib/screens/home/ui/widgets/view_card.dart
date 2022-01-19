import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:recyclo/models/post.dart';
import 'package:recyclo/screens/home/controller/home.dart';
import 'package:recyclo/services/network_handler.dart';

import 'package:recyclo/utils/shared/app_colors.dart';
import 'package:recyclo/utils/widgets/box_text.dart';

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class ViewCard extends StatelessWidget {
  int length = 100;

  final HomeController homeController = Get.find();

  PostModel post;
  ViewCard({
    Key? key,
    required this.post,
  }) : super(key: key);

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

    homeController.checkImageUrl(post.photo);

    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                        child: Text('Get Procedure'),
                      ),
                      const PopupMenuItem<int>(
                        value: 1,
                        child: Text('Buy'),
                      ),
                      const PopupMenuItem<int>(
                        value: 2,
                        child: Text('Copy Link'),
                      ),
                      const PopupMenuItem<int>(
                        value: 3,
                        child: Text('Share to..'),
                      ),
                      const PopupMenuItem<int>(
                        value: 3,
                        child: Text('Unfollow'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Obx(
              () => (homeController.checkImage.value == true)
                  ? Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            post.photo,
                          ),
                        ),
                      ),
                      width: double.infinity,
                      height: 400.0,
                    )
                  : Container(
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                      ),
                      width: double.infinity,
                      height: 400.0,
                    ),
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
                    Text.rich(
                      TextSpan(
                        children: <InlineSpan>[
                          TextSpan(
                              text: post.caption.length > length &&
                                      !homeController.showAll.value
                                  ? post.caption.substring(0, length) + "..."
                                  : post.caption),
                          post.caption.length > length
                              ? WidgetSpan(
                                  child: GestureDetector(
                                    onTap: () {
                                      homeController.showAll.value =
                                          !homeController.showAll.value;
                                    },
                                    child: Text(
                                      homeController.showAll.value
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
                      ),
                    ),
                  ]),
            ),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ],
    );
  }
}
