import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:recyclo/models/post.dart';
import 'package:recyclo/screens/add/controller/add.dart';
import 'package:recyclo/screens/navbar/controller/navbar.dart';
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
                    child: TextField(
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
                      ),
                      textInputAction: TextInputAction.newline,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                  ),
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
                      Map<String, String> postData = {
                        "caption": addController.captionController.text,
                        "procedure": addController.procedureController.text,
                        "price": addController.priceController.text,
                      };

                      var response =
                          await networkHandler.post("/add-post", postData);

                      if (response.statusCode == 200 ||
                          response.statusCode == 201) {
                        var imageResponse = await networkHandler.patchImage(
                          "/add-post",
                          addController.pickedFile!.path,
                        );
                      }

                      Get.close(2);
                      Get.snackbar(
                        'Post Added',
                        'Your post has been successfully added to your account',
                      );
                      addController.priceController.clear();
                      addController.captionController.clear();
                      addController.procedureController.clear();
                      addController.tags.value = [];
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
