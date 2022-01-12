import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recyclo/screens/fav/controller/fav.dart';
import 'package:recyclo/screens/fav/ui/widgets/view_card2.dart';
import 'package:recyclo/utils/shared/app_colors.dart';
import 'package:recyclo/utils/widgets/box_input_field.dart';

import 'package:recyclo/utils/widgets/box_text.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FavController favController = Get.put(FavController());
    final TextEditingController textEditingController = TextEditingController();
    ScrollController scrollController = ScrollController();
    return Scaffold(
      appBar: AppBar(
        title: const BoxText.headingThree(
          'Fav',
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: CustomScrollView(
        physics: const ScrollPhysics(),
        slivers: [
          // SliverAppBar(
          //   backgroundColor: Colors.transparent,
          //   iconTheme: IconThemeData(color: Colors.white),
          //   expandedHeight: 500,
          // ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
                  child: Column(
                    children: [
                      BoxInputField(
                        placeholder: 'Search',
                        controller: textEditingController,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  height: 50.0,
                  child: ListView.builder(
                    shrinkWrap: true,
                    //controller: ,
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) => Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: kcPrimaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 20.0,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'ewaste',
                                  style: TextStyle(
                                      color: Colors.teal.shade600,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.cancel_rounded,
                                    color: kcPrimaryColor.withOpacity(0.4),
                                  ),
                                ),
                              ],
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
                Flexible(
                  child: ListView.builder(
                    controller: scrollController,
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return ViewCard2(index: index);
                    },
                  ),
                ),
              ],
            ),
          ),
          SliverList(delegate: SliverChildListDelegate([]))
        ],
      ),
    );
  }
}
