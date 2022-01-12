import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:recyclo/screens/search/controller/search.dart';
import 'package:recyclo/screens/search/ui/widgets/image_option.dart';
import 'package:recyclo/utils/shared/app_colors.dart';
import 'package:recyclo/utils/widgets/box_input_field.dart';
import 'package:recyclo/utils/widgets/box_text.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearchController searchController = Get.put(SearchController());
    ScrollController scrollController = ScrollController();
    ScrollController horizontalController = ScrollController();
    TextEditingController filterController = TextEditingController();
    TextEditingController searchText = TextEditingController();
    void clearSearch() {
      if (searchController.result.isEmpty) {
        searchText.clear();
      }
    }

    searchText.addListener(() {
      searchController.getKeywords(searchText.text);
    });
    return Scaffold(
      appBar: AppBar(
          title: const BoxText.blackText(
            'Search',
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          actions: [
            Obx(() {
              if (searchController.result.isNotEmpty &&
                  searchController.searchImage.value == true) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: InkWell(
                    onTap: () {
                      searchController.searchImage.value = false;
                    },
                    child: const BoxText.inkedText('Done'),
                  ),
                );
              } else if (searchController.result.isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: InkWell(
                    onTap: () {
                      searchController.refreshdata();
                      searchText.clear();
                    },
                    child: const BoxText.inkedText('Clear all'),
                  ),
                );
              } else {
                return const SizedBox(
                  height: 20.0,
                );
              }
            })
          ]),
      body: ListView(
        children: [
          Obx(() {
            return (searchController.searchImage.value == false)
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 20.0,
                    ),
                    child: BoxInputField(
                      controller: searchText,
                      placeholder: 'Search',
                      leading: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          color: kcLightGreyColor,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          searchController.searchImage.value = true;
                        },
                        icon: const Icon(
                          Icons.image,
                          color: kcLightGreyColor,
                        ),
                      ),
                    ),
                  )
                : const SizedBox(
                    height: 10.0,
                  );
          }),
          Obx(() {
            return (searchController.searchImage.value == true)
                ? Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: kcLightGreyColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20.0),
                        child: (searchController.imagePath.value != '')
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.file(
                                  File(searchController.imagePath.value),
                                  height: 400.0,
                                  width: 500.0,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : SizedBox(
                                width: 400.0,
                                height: 400.0,
                                child: Icon(
                                  FontAwesomeIcons.image,
                                  color: Colors.black.withOpacity(0.1),
                                  size: 100.0,
                                ),
                              ),
                      ),
                      Positioned(
                        top: 340,
                        right: 40.0,
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (ctx) => const ImageOptions(),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: grad1,
                                borderRadius: BorderRadius.circular(40.0)),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 18.0,
                                vertical: 18.0,
                              ),
                              child: Icon(
                                FontAwesomeIcons.cameraRetro,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 340,
                        right: 40.0,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text('Type your Keywords'),
                                    content: BoxInputField(
                                      controller: filterController,
                                      placeholder: 'Type here...',
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          searchController.result
                                              .add(filterController.text);
                                          Get.back();
                                          filterController.clear();
                                        },
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    gradient: grad1,
                                    borderRadius: BorderRadius.circular(40.0)),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 18.0,
                                    vertical: 18.0,
                                  ),
                                  child: Icon(
                                    Icons.text_fields,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (ctx) => const ImageOptions(),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    gradient: grad1,
                                    borderRadius: BorderRadius.circular(40.0)),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 18.0,
                                    vertical: 18.0,
                                  ),
                                  child: Icon(
                                    FontAwesomeIcons.cameraRetro,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : const SizedBox(
                    height: 5.0,
                  );
          }),
          Obx(
            () {
              return (searchController.result.isNotEmpty)
                  ? (searchController.searchImage.isTrue)
                      ? Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: StaggeredGridView.countBuilder(
                            scrollDirection: Axis.vertical,
                            controller: scrollController,
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(12.0),
                            crossAxisCount: 4,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 8,
                            itemCount: searchController.result.length,
                            itemBuilder: (BuildContext context, int index) =>
                                Card(
                              color: kcPrimaryColor.withOpacity(0.1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 0.0,
                              child: ListTile(
                                title: Text(
                                  searchController.result[index],
                                  style: TextStyle(
                                      color: Colors.teal.shade600,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700),
                                ),
                                trailing: IconButton(
                                    onPressed: () {
                                      searchController.result.removeAt(index);
                                    },
                                    icon: Icon(
                                      Icons.cancel_rounded,
                                      color: kcPrimaryColor.withOpacity(0.4),
                                    )),
                              ),
                            ),
                            staggeredTileBuilder: (int index) =>
                                const StaggeredTile.fit(2),
                          ),
                        )
                      : Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20.0),
                          height: 50.0,
                          child: ListView.builder(
                            shrinkWrap: true,
                            //controller: ,
                            scrollDirection: Axis.horizontal,
                            itemCount: searchController.result.length,
                            itemBuilder: (BuildContext context, int index) =>
                                Row(
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
                                          searchController.result[index],
                                          style: TextStyle(
                                              color: Colors.teal.shade600,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            searchController.result
                                                .removeAt(index);
                                          },
                                          icon: Icon(
                                            Icons.cancel_rounded,
                                            color:
                                                kcPrimaryColor.withOpacity(0.4),
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
                        )
                  : const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
