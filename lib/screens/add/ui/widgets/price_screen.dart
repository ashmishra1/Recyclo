import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:recyclo/models/post.dart';
import 'package:recyclo/screens/add/controller/add.dart';
import 'package:recyclo/screens/navbar/controller/navbar.dart';
import 'package:recyclo/screens/navbar/ui/navbar.dart';
import 'package:recyclo/services/network_handler.dart';
import 'package:recyclo/utils/shared/app_colors.dart';
import 'package:recyclo/utils/shared/ui_helpers.dart';

class PriceScreen extends StatelessWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NetworkHandler networkHandler = NetworkHandler();
    NavbarController navbarController = Get.find();
    AddController addController = Get.find();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Get.close(1);
            },
            icon: const Icon(Icons.close, color: Colors.black)),
      ),
      body: SafeArea(
        child: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: [
            SizedBox(
              height: screenHeightPercentage(
                context,
                percentage: 0.45,
              ),
              width: screenWidthPercentage(context, percentage: 0.8),
              child: SvgPicture.asset(
                'assets/money.svg',
                height: 20.0,
                width: 20.0,
                allowDrawingOutsideViewBox: true,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Enter price of your product?',
                    style:
                        TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Obx(() {
                        return TextField(
                          controller: addController.priceController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                              borderSide: const BorderSide(
                                color: kcPrimaryColor,
                              ),
                            ),
                            hintText: 'in Rs.',
                            labelText: 'Price',
                            errorText:
                                addController.validatePrice.value == 'empty'
                                    ? 'Price Can\'t Be Empty'
                                    : null,
                          ),
                          keyboardType: TextInputType.number,
                          maxLines: 1,
                        );
                      })),
                ],
              ),
            ),
            const SizedBox(height: 80.0),
            Container(
              alignment: Alignment.topRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: kcPrimaryColor),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 15.0),
                        child: Text('SKIP'),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      if (addController.priceController.text.isEmpty ||
                          addController.priceController.text == '') {
                        addController.validatePrice.value = 'empty';
                      } else {
                        addController.validatePrice.value = 'filled';
                      }
                      if (addController.validatePrice.value == 'filled') {
                        var status = networkHandler.newPost(
                          "/add-post",
                          addController.pickedFile!.path,
                          addController.captionController.text,
                          addController.tags.join(","),
                          addController.procedureController.text,
                          addController.priceController.text,
                          addController.itemsController.text,
                        );

                        if (status.toString() == '200' ||
                            status.toString() == '201') {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(
                            const SnackBar(
                              content: Text("Cannot add the post"),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(
                            const SnackBar(
                              content: Text("Post Added Successfully"),
                            ),
                          );
                        }

                        Get.close(2);

                        addController.priceController.clear();
                        addController.captionController.clear();
                        addController.procedureController.clear();
                        addController.tags.value = [];
                        addController.imagePath.value = '';
                      }
                      Get.to(() => const Navbar());
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          gradient: grad1,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 15.0),
                        child: Text('POST'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
