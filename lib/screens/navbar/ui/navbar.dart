import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:recyclo/screens/account/ui/account.dart';
import 'package:recyclo/screens/add/ui/add.dart';
import 'package:recyclo/screens/fav/ui/fav.dart';
import 'package:recyclo/screens/home/ui/home.dart';
import 'package:recyclo/screens/navbar/controller/navbar.dart';
import 'package:recyclo/screens/search/ui/search.dart';
import 'package:recyclo/utils/shared/app_colors.dart';

class Navbar extends StatelessWidget {
  Navbar({Key? key}) : super(key: key);
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    NavbarController navbarController = Get.put(NavbarController());
    PersistentTabController _controller;

    _controller = PersistentTabController(initialIndex: 0);
    return GetBuilder<NavbarController>(builder: (_) {
      return Scaffold(
        // body: IndexedStack(
        //   index: navbarController.tabIndex,
        //   children: const [
        //     HomeScreen(),
        //     FavScreen(),
        //     AddScreen(),
        //     SearchScreen(),
        //     AccountScreen(),
        //   ],
        // ),
        body: SafeArea(
          child: PersistentTabView(
            context,
            controller: _controller,
            screens: _buildScreens(),
            items: _navBarsItems(),
            confineInSafeArea: true,
            backgroundColor: Colors.white, // Default is Colors.white.
            handleAndroidBackButtonPress: true, // Default is true.
            resizeToAvoidBottomInset:
                true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
            stateManagement: true, // Default is true.
            hideNavigationBarWhenKeyboardShows:
                true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
            decoration: NavBarDecoration(
              borderRadius: BorderRadius.circular(10.0),
              colorBehindNavBar: Colors.white,
            ),
            popAllScreensOnTapOfSelectedTab: true,
            popActionScreens: PopActionScreensType.all,
            itemAnimationProperties: const ItemAnimationProperties(
              // Navigation Bar's items animation properties.
              duration: Duration(milliseconds: 200),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: const ScreenTransitionAnimation(
              // Screen transition animation on change of selected tab.
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ),
            navBarStyle: NavBarStyle
                .style15, // Choose the nav bar style with this property.
          ),
        ),
        // bottomNavigationBar: CurvedNavigationBar(
        //   index: 0,
        //   height: 60.0,
        //   items: const <Widget>[
        //     Icon(Icons.home_outlined, size: 30),
        //     Icon(Icons.receipt_long_outlined, size: 30),
        //     Icon(Icons.add_outlined, size: 30),
        //     Icon(Icons.search_outlined, size: 30),
        //     Icon(Icons.person_outline, size: 30),
        //   ],
        //   color: Colors.white,
        //   buttonBackgroundColor: Colors.white,
        //   backgroundColor: Colors.grey.shade50,
        //   animationCurve: Curves.easeInOut,
        //   animationDuration: const Duration(milliseconds: 600),
        //   onTap: (index) {
        //     navbarController.tabIndex = index;
        //   },
        //   letIndexChange: (index) => true,
        // ),
      );
    });
  }
}

List<Widget> _buildScreens() {
  return [
    const HomeScreen(),
    const FavScreen(),
    const AddScreen(),
    const SearchScreen(),
    const AccountScreen(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(
        CupertinoIcons.home,
        size: 23,
      ),
      title: ("Home"),
      activeColorPrimary: kcPrimaryColor,
      inactiveColorPrimary: kcMediumGreyColor,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(
        CupertinoIcons.square_favorites_alt,
        size: 23,
      ),
      title: ("Explore"),
      activeColorPrimary: kcPrimaryColor,
      inactiveColorPrimary: kcMediumGreyColor,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(
        CupertinoIcons.add,
        color: Colors.white,
        size: 30,
      ),
      //title: (""),
      activeColorPrimary: kcPrimaryColor,
      inactiveColorPrimary: kcMediumGreyColor,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(
        CupertinoIcons.search,
        size: 23,
      ),
      title: ("Search"),
      activeColorPrimary: kcPrimaryColor,
      inactiveColorPrimary: kcMediumGreyColor,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(
        CupertinoIcons.person,
        size: 23,
      ),
      title: ("Account"),
      activeColorPrimary: kcPrimaryColor,
      inactiveColorPrimary: kcMediumGreyColor,
    ),
  ];
}
