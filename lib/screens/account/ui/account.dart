import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:recyclo/screens/account/controller/account.dart';
import 'package:recyclo/screens/login/ui/login.dart';
import 'package:recyclo/screens/phone_auth/ui/widgets/auth_screen.dart';
import 'package:recyclo/screens/post/ui/post.dart';
import 'package:recyclo/services/authentication.dart';
import 'package:recyclo/services/network_handler.dart';
import 'package:recyclo/utils/shared/app_colors.dart';
import 'package:recyclo/utils/shared/ui_helpers.dart';

import 'package:recyclo/utils/widgets/box_button.dart';
import 'package:recyclo/utils/widgets/box_text.dart';
import 'package:transparent_image/transparent_image.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myProducts = ['dff', 'kll', 'jji', 'jk'];
    List<String> imageList = [
      'https://images.unsplash.com/photo-1588867702719-969c8ac733d6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80',
      'https://images.unsplash.com/photo-1487424439918-bc6b5bef0380?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1333&q=80',
      'https://images.unsplash.com/photo-1485433592409-9018e83a1f0d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=421&q=80',
      'https://images.unsplash.com/photo-1422207134147-65fb81f59e38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1964&q=80',
      'https://images.unsplash.com/photo-1604537466608-109fa2f16c3b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1169&q=80',
      'https://images.unsplash.com/photo-1551582045-6ec9c11d8697?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1965&q=80',
      'https://images.unsplash.com/photo-1536849187706-3dbe94687839?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      'https://images.unsplash.com/photo-1459749411175-04bf5292ceea?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    ];
    final AccountController homeController = Get.put(AccountController());
    final AuthClass authClass = Get.put(AuthClass());
    ScrollController scrollController = ScrollController();
    NetworkHandler networkHandler = NetworkHandler();
    return Scaffold(
      appBar: AppBar(
        title: const BoxText.headingThree(
          'damish',
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://midlandstraining.co.za/wp-content/uploads/2021/05/user-1.jpg'),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Ashutosh Mishra',
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                BoxText.blackText(
                                  'Posts',
                                ),
                                Text('13')
                              ],
                            ),
                            SizedBox(
                              width: screenWidthPercentage(
                                context,
                                percentage: 0.05,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                BoxText.blackText('Subscribers'),
                                Text('47')
                              ],
                            ),
                            SizedBox(
                              width: screenWidthPercentage(
                                context,
                                percentage: 0.05,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                BoxText.blackText('Rating'),
                                Text('3.6')
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'Earnings',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Your Income',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: kcPrimaryColor),
                            ),
                            Text('Rs. 3,00,000')
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Your Payements',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            Text('Rs. 40,000')
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Have to pay',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange),
                            ),
                            Text('Nothing')
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'Posts',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: screenHeightPercentage(context, percentage: 0.5),
            child: FutureBuilder<List>(
                future: networkHandler.getPosts("/posts"),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text('No Posts'),
                      );
                    }
                    return StaggeredGridView.countBuilder(
                      scrollDirection: Axis.vertical,
                      controller: scrollController,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(12.0),
                      crossAxisCount: 4,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 8,
                      itemCount: imageList.length,
                      itemBuilder: (BuildContext context, int index) => InkWell(
                        onTap: () {
                          Get.to(
                            () => PostScreen(
                              postUrl: imageList[index],
                            ),
                          );
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.transparent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            child: FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: imageList[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      staggeredTileBuilder: (int index) =>
                          const StaggeredTile.fit(2),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          )
        ],
      ),
    );
  }
}
