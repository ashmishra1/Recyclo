import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recyclo/screens/fav/controller/fav.dart';
import 'package:recyclo/utils/shared/app_colors.dart';
import 'package:recyclo/utils/widgets/box_text.dart';

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class ViewCard2 extends StatelessWidget {
  int length = 100;
  final int index;
  final FavController favController = Get.find();
  ViewCard2({
    Key? key,
    required this.index,
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

    return Column(
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
                        child: Text('Report'),
                      ),
                      const PopupMenuItem<int>(
                        value: 1,
                        child: Text('Hide'),
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
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://www.nobroker.in/blog/wp-content/uploads/2020/05/Ideas-to-Decorate-Your-Home1.png',
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
                              text: favController.myText.value.length >
                                          length &&
                                      !favController.showAll.value
                                  ? favController.myText.substring(0, length) +
                                      "..."
                                  : favController.myText.value),
                          favController.myText.value.length > length
                              ? WidgetSpan(
                                  child: GestureDetector(
                                    onTap: () {
                                      favController.showAll.value =
                                          !favController.showAll.value;
                                    },
                                    child: Text(
                                      favController.showAll.value
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
    );
  }
}
