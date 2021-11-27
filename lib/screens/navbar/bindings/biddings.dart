import 'package:get/get.dart';
import 'package:recyclo/screens/account/controller/account.dart';
import 'package:recyclo/screens/add/controller/add.dart';
import 'package:recyclo/screens/fav/controller/fav.dart';
import 'package:recyclo/screens/home/controller/home.dart';
import 'package:recyclo/screens/search/controller/search.dart';

class NavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
      fenix: true,
    );
    Get.lazyPut<FavController>(
      () => FavController(),
      fenix: true,
    );
    Get.lazyPut<AddController>(
      () => AddController(),
      fenix: true,
    );
    Get.lazyPut<SearchController>(
      () => SearchController(),
      fenix: true,
    );
    Get.lazyPut<AccountController>(
      () => AccountController(),
      fenix: true,
    );
  }
}
