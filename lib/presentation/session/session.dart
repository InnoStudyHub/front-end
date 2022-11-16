import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../util/color_codes.dart';
import 'create/create_deck_page.dart';
import 'home/home_page.dart';
import 'home/search/search_page.dart';
import 'profile/profile_page.dart';
import 'session_controller.dart';

class Session extends StatelessWidget {
  const Session({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return GetBuilder<SessionController>(builder: (controller) {
      return kIsWeb
          ? _web(controller, screenSize)
          : Scaffold(
              appBar: _appBar(controller),
              body: SafeArea(
                child: IndexedStack(
                  index: controller.tabIndex,
                  children: const [
                    HomePage(),
                    CreateDeckPage(),
                    ProfilePage(),
                  ],
                ),
              ),
              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: const Color.fromARGB(255, 36, 47, 61),
                onTap: controller.changePage,
                currentIndex: controller.tabIndex,
                showUnselectedLabels: false,
                showSelectedLabels: false,
                type: BottomNavigationBarType.fixed,
                items: [
                  _homePageItem(controller.tabIndex),
                  _createPageItem(controller.tabIndex),
                  _profilePageItem(controller.tabIndex),
                ],
              ),
            );
    });
  }

  _homePageItem(int index) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        "assets/icons/bottom_bar/home_bottom_bar_ic.svg",
        color: index == 0 ? selectedMenuColor : unselectedMenuColor,
      ),
      label: "Home",
    );
  }

  _createPageItem(int index) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        "assets/icons/bottom_bar/create_bottom_bar_ic.svg",
        color: index == 1 ? selectedMenuColor : unselectedMenuColor,
      ),
      label: "Create",
    );
  }

  _profilePageItem(int index) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        "assets/icons/bottom_bar/profile_bottom_bar_ic_no_notification.svg",
        color: index == 2 ? selectedMenuColor : unselectedMenuColor,
      ),
      label: "Profile",
    );
  }

  Scaffold _web(SessionController controller, Size screenSize) {
    return Scaffold(
      appBar: _webAppBar(controller, screenSize),
      body: SafeArea(
        child: IndexedStack(
          index: controller.tabIndex,
          children: const [
            HomePage(),
            CreateDeckPage(),
            ProfilePage(),
          ],
        ),
      ),
    );
  }

  _webHomePageItem(SessionController controller) {
    return BottomNavigationBarItem(
      icon: Text(
        'Home',
        style: TextStyle(
          color:
              controller.tabIndex == 0 ? selectedMenuColor : unselectedTabColor,
          fontSize: 20,
          fontFamily: 'Roboto',
        ),
      ),
      label: "Home",
    );
  }

  _webCreatePageItem(SessionController controller) {
    return BottomNavigationBarItem(
      icon: Text(
        'Create',
        style: TextStyle(
          color:
              controller.tabIndex == 1 ? selectedMenuColor : unselectedTabColor,
          fontSize: 20,
          fontFamily: 'Roboto',
        ),
      ),
      label: "Create",
    );
  }

  _webProfilePageItem(SessionController controller) {
    return BottomNavigationBarItem(
      icon: Text(
        'Profile',
        style: TextStyle(
          color:
              controller.tabIndex == 2 ? selectedMenuColor : unselectedTabColor,
          fontSize: 20,
          fontFamily: 'Roboto',
        ),
      ),
      label: "Profile",
    );
  }

  AppBar _appBar(SessionController controller) {
    return AppBar(
      title: Text(controller.tabTitle),
      actions: [
        if (controller.tabTitle == "Home")
          IconButton(
            onPressed: () {
              Get.to(() => const SearchPage());
            },
            icon: const Icon(Icons.search, color: greySecondary),
          ),
      ],
      elevation: 0,
    );
  }

  AppBar _webAppBar(SessionController controller, Size screenSize) {
    return AppBar(
      // preferredSize: Size(screenSize.width, 60),
      flexibleSpace: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 36, 47, 61),
        onTap: controller.changePage,
        currentIndex: controller.tabIndex,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          _webHomePageItem(controller),
          _webCreatePageItem(controller),
          _webProfilePageItem(controller),
        ],
      ),
    );
  }
}
