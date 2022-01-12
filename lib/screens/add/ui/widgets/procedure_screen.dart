import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:recyclo/screens/add/controller/add.dart';
import 'package:recyclo/screens/add/ui/widgets/price_screen.dart';
import 'package:recyclo/utils/shared/app_colors.dart';
import 'package:recyclo/utils/shared/ui_helpers.dart';
import 'package:recyclo/utils/widgets/box_text.dart';

class ProcedureScreen extends StatelessWidget {
  const ProcedureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddController addController = Get.put(AddController());
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
          child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 20.0,
        ),
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
                'assets/process.svg',
                height: 20.0,
                width: 20.0,
                allowDrawingOutsideViewBox: true,
              ),
            ),
            BoxText.body('Add making procedure'),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
              controller: addController.procedureController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                  borderSide: const BorderSide(
                    color: kcPrimaryColor,
                  ),
                ),
                hintText: 'Describe the procedures to make your product',
                helperText: 'Keep it descriptive and easy to understand',
                labelText: 'Procedure',
              ),
              textInputAction: TextInputAction.newline,
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
            const SizedBox(
              height: 80.0,
            ),
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
                    onTap: () {
                      Get.to(() => const PriceScreen());
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
              height: 40.0,
            )
          ],
        ),
      )),
    );
  }
}
