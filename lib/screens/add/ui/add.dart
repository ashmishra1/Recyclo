import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recyclo/screens/add/controller/add.dart';
import 'package:recyclo/screens/add/ui/widgets/procedure_screen.dart';
import 'package:recyclo/services/network_handler.dart';
import 'package:recyclo/utils/shared/app_colors.dart';
import 'package:recyclo/utils/widgets/box_text.dart';

import '../../../utils/shared/ui_helpers.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AddController addController = Get.put(AddController());
    NetworkHandler networkHandler = NetworkHandler();

    List<String> items = ['Bottle', 'Plank', 'Tyre', 'Coir', 'Card Boards'];

    return Scaffold(
      appBar: AppBar(
        title: const BoxText.headingThree(
          'Add Post',
        ),
        backgroundColor: const Color.fromARGB(255, 252, 252, 252),
        elevation: 0.0,
      ),
      body: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BoxText.body('Upload an Image or a Video'),
                const SizedBox(
                  height: 20.0,
                ),
                Obx(
                  () => SizedBox(
                    height: screenHeightPercentage(
                      context,
                      percentage: 0.45,
                    ),
                    width: screenWidthPercentage(context, percentage: 1),
                    child: (addController.imagePath.value != '')
                        ? Expanded(
                            //borderRadius: BorderRadius.circular(20.0),
                            child: Image.file(
                              File(addController.imagePath.value),
                              height: 400.0,
                              width: 400.0,
                              fit: BoxFit.cover,
                            ),
                          )
                        : SvgPicture.asset(
                            'assets/image_upload.svg',
                            height: 20.0,
                            width: 20.0,
                            allowDrawingOutsideViewBox: true,
                          ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        addController.selectImage(ImageSource.gallery);
                        print(addController.imageFile);
                      },
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 14.0),
                          child: Row(
                            children: const [
                              Icon(
                                CupertinoIcons.arrow_up_circle,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                'UPLOAD',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              )
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          gradient: grad1,
                          borderRadius: BorderRadius.circular(
                            10.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    InkWell(
                      onTap: () {
                        addController.selectImage(
                          ImageSource.camera,
                        );
                      },
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 14.0,
                          ),
                          child: Row(
                            children: const [
                              Icon(
                                CupertinoIcons.camera,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                'CAMERA',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              )
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          gradient: grad1,
                          borderRadius: BorderRadius.circular(
                            10.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40.0,
                ),
                BoxText.body('Add a Caption'),
                const SizedBox(
                  height: 20.0,
                ),
                Obx(() {
                  return TextField(
                    controller: addController.captionController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                        borderSide: const BorderSide(
                          color: kcPrimaryColor,
                        ),
                      ),
                      focusColor: kcPrimaryColor,
                      hintText: 'Write something here',
                      helperText: 'Keep it short and simple',
                      labelText: 'Caption',
                      errorText: addController.validateCaption.value == 'empty'
                          ? 'Caption Can\'t Be Empty'
                          : null,
                    ),
                    textInputAction: TextInputAction.newline,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                  );
                }),
                const SizedBox(
                  height: 40.0,
                ),
                BoxText.body('Select all tags related to your post - '),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Wrap(
                      spacing: 8.0,
                      children: [
                        for (int i = 0; i < addController.tags.length; i++)
                          Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 5.0,
                            ),
                            decoration: BoxDecoration(
                              color: kcPrimaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Wrap(
                              children: [
                                FilterChip(
                                  backgroundColor:
                                      kcPrimaryColor.withOpacity(0.1),
                                  label: Text(
                                    addController.tags[i],
                                    style: TextStyle(
                                        color: Colors.teal.shade600,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  onSelected: ((val) {}),
                                  // selected:
                                  //     applicationBloc.placeType  =='campground',
                                  // selectedColor: Colors.blue,
                                ),
                                IconButton(
                                  onPressed: () {
                                    addController.tags.removeAt(i);
                                  },
                                  icon: Icon(
                                    Icons.cancel_rounded,
                                    color: kcPrimaryColor.withOpacity(0.4),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        PopupMenuButton(
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                vertical: 5.0,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color: kcPrimaryColor.withOpacity(0.6),
                                  )),
                              child: Wrap(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 12.0),
                                    child: Text(
                                      '+ Add Tags',
                                      style: TextStyle(
                                          color:
                                              kcPrimaryColor.withOpacity(0.6),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            offset: const Offset(-1.0, -220.0),
                            elevation: 8,
                            color: Colors.white,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            itemBuilder: (context) {
                              return <PopupMenuEntry<Widget>>[
                                PopupMenuItem<Widget>(
                                  child: Container(
                                    decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    child: Scrollbar(
                                      child: ListView.builder(
                                        padding: const EdgeInsets.only(top: 20),
                                        itemCount: items.length,
                                        itemBuilder: (context, index) {
                                          final trans = items[index];
                                          return InkWell(onLongPress: () {
                                            addController.tags
                                                .add(items[index]);
                                          }, child: Obx(() {
                                            return ListTile(
                                              title: Text(
                                                trans.toString(),
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                              trailing: (addController.tags
                                                      .contains(items[index]))
                                                  ? IconButton(
                                                      onPressed: () {},
                                                      icon: const Icon(
                                                        Icons
                                                            .check_circle_outline,
                                                        color: kcPrimaryColor,
                                                      ),
                                                    )
                                                  : const SizedBox(
                                                      height: 0.0,
                                                      width: 0.0,
                                                    ),
                                              onTap: () {
                                                //what would you like to do?
                                              },
                                            );
                                          }));
                                        },
                                      ),
                                    ),
                                    height: 250,
                                    width: 500,
                                  ),
                                )
                              ];
                            }),
                      ],
                    ),
                  ),
                ),
                const Text(
                  '(Long-press the tags to select)',
                  style: TextStyle(color: Colors.black26),
                ),
                const SizedBox(
                  height: 60.0,
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () async {
                          addController.captionController.clear();

                          addController.tags.value = [];

                          print(addController.pickedFile?.name);
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: kcPrimaryColor),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 15.0),
                            child: Text('RESET'),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (addController.captionController.text.isEmpty ||
                              addController.captionController.text == '') {
                            addController.validateCaption.value = 'empty';
                          } else {
                            addController.validateCaption.value = 'filled';
                          }
                          if (addController.tags.isNotEmpty &&
                              addController.validateCaption.value == 'filled' &&
                              addController.pickedFile?.path != null) {
                            Get.to(() => const ProcedureScreen());
                          } else if (addController.tags.isEmpty &&
                              addController.pickedFile?.path == null) {
                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(
                              const SnackBar(
                                content: Text("Add Tags and Upload Image"),
                              ),
                            );
                          } else if (addController.tags.isEmpty) {
                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(
                              const SnackBar(
                                content: Text("Add Tags"),
                              ),
                            );
                          } else if (addController.pickedFile?.path == null) {
                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(
                              const SnackBar(
                                content: Text("Upload Image"),
                              ),
                            );
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              gradient: grad1,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 15.0),
                            child: Text('NEXT'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 60,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
