import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recyclo/screens/fav/controller/fav.dart';
import 'package:recyclo/screens/fav/ui/widgets/view_card2.dart';
import 'package:recyclo/services/network_handler.dart';
import 'package:recyclo/utils/shared/app_colors.dart';
import 'package:recyclo/utils/widgets/box_input_field.dart';

import 'package:recyclo/utils/widgets/box_text.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> tags = [
      'today',
      'trending',
      'Organic',
      'E-waste',
      'Metal',
      'Household waste',
      'Card Boards',
    ];
    final FavController favController = Get.put(FavController());
    final TextEditingController textEditingController = TextEditingController();
    ScrollController scrollController = ScrollController();
    NetworkHandler networkHandler = NetworkHandler();
    return Scaffold(
      appBar: AppBar(
        title: const BoxText.headingThree(
          'Explore',
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Stack(children: [
        Obx(() {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 60.0),
            child: FutureBuilder<List>(
                future: networkHandler.explorePost(
                    "/explore", {"tag": favController.selectedTag.value}),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text('No Posts'),
                      );
                    }
                    return ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (ctx, index) => ViewCard2(
                              id: snapshot.data![index]["_id"],
                              caption: snapshot.data![index]["caption"],
                              tags: snapshot.data![index]["tags"],
                              procedure: snapshot.data![index]["procedure"],
                              price: snapshot.data![index]["price"],
                              photo: snapshot.data![index]["photo"],
                              createdAt: DateTime.parse(
                                  snapshot.data![index]["createdAt"]),
                              updatedAt: DateTime.parse(
                                  snapshot.data![index]["updatedAt"]),
                            ));
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
          );
        }),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          height: 50.0,
          child: ListView.builder(
            shrinkWrap: true,
            //controller: ,
            scrollDirection: Axis.horizontal,
            itemCount: tags.length,
            itemBuilder: (BuildContext context, int index) => Row(
              children: [
                InkWell(
                  onTap: () {
                    favController.selectedTag.value = tags[index];
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: kcPrimaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        tags[index],
                        style: TextStyle(
                            color: Colors.teal.shade600,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                )
              ],
            ),
          ),
        ),
      ]),
      // body: CustomScrollView(
      //   physics: const ScrollPhysics(),
      //   slivers: [
      //     SliverList(
      //       delegate: SliverChildListDelegate(
      //         [
      //           // Container(
      //           //   margin: const EdgeInsets.symmetric(
      //           //       horizontal: 20.0, vertical: 20.0),
      //           //   child: Column(
      //           //     children: [
      //           //       BoxInputField(
      //           //         placeholder: 'Search',
      //           //         controller: textEditingController,
      //           //       ),
      //           //     ],
      //           //   ),
      //           // ),
      //           Container(
      //             margin: const EdgeInsets.symmetric(horizontal: 20.0),
      //             height: 50.0,
      //             child: ListView.builder(
      //               shrinkWrap: true,
      //               //controller: ,
      //               scrollDirection: Axis.horizontal,
      //               itemCount: tags.length,
      //               itemBuilder: (BuildContext context, int index) => Row(
      //                 children: [
      //                   InkWell(
      //                     onTap: () {},
      //                     child: Container(
      //                       decoration: BoxDecoration(
      //                         color: kcPrimaryColor.withOpacity(0.1),
      //                         borderRadius: BorderRadius.circular(10.0),
      //                       ),
      //                       child: Padding(
      //                         padding: const EdgeInsets.all(15.0),
      //                         child: Text(
      //                           tags[index],
      //                           style: TextStyle(
      //                               color: Colors.teal.shade600,
      //                               fontSize: 16.0,
      //                               fontWeight: FontWeight.w700),
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                   const SizedBox(
      //                     width: 10.0,
      //                   )
      //                 ],
      //               ),
      //             ),
      //           ),
      //           Flexible(
      //               child: FutureBuilder<List>(
      //                   future: networkHandler.getPosts("/posts"),
      //                   builder: (context, snapshot) {
      //                     if (snapshot.hasData) {
      //                       if (snapshot.data!.isEmpty) {
      //                         return const Center(
      //                           child: Text('No Posts'),
      //                         );
      //                       }
      //                       return ListView.builder(
      //                           itemCount: snapshot.data?.length,
      //                           itemBuilder: (ctx, index) => ViewCard2(
      //                                 id: snapshot.data![index]["_id"],
      //                                 caption: snapshot.data![index]["caption"],
      //                                 tags: snapshot.data![index]["tags"],
      //                                 procedure: snapshot.data![index]
      //                                     ["procedure"],
      //                                 price: snapshot.data![index]["price"],
      //                                 photo: snapshot.data![index]["photo"],
      //                                 createdAt: DateTime.parse(
      //                                     snapshot.data![index]["createdAt"]),
      //                                 updatedAt: DateTime.parse(
      //                                     snapshot.data![index]["updatedAt"]),
      //                               ));
      //                     } else if (snapshot.hasError) {
      //                       return Center(
      //                         child: Text(snapshot.error.toString()),
      //                       );
      //                     } else {
      //                       return Center(
      //                         child: CircularProgressIndicator(),
      //                       );
      //                     }
      //                   })),
      //         ],
      //       ),
      //     ),
      //     SliverList(delegate: SliverChildListDelegate([]))
      //   ],
      // ),
    );
  }
}
