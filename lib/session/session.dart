import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:study_hub/util/color_codes.dart';
import 'create/create_page.dart';
import 'profile/profile_page.dart';
import 'favourites/favourites_page.dart';
import 'session_controller.dart';
import 'home/home_page.dart';

class Session extends StatelessWidget {
  const Session({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SessionController>(builder: (controller) {
      return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: const Color.fromARGB(255, 36, 47, 61),
        //   title: Text(controller.tabTitle),
        // ),
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: const [
              HomePage(),
              ProfilePage(),
              FavouritesPage(),
              CreatePage(),
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
            _profilePageItem(controller.tabIndex),
            _favouritePageItem(controller.tabIndex),
            _createPageItem(controller.tabIndex),
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

  _profilePageItem(int index) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        "assets/icons/bottom_bar/profile_bottom_bar_ic_no_notification.svg",
        color: index == 1 ? selectedMenuColor : unselectedMenuColor,
      ),
      label: "Profile",
    );
  }

  _favouritePageItem(int index) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        "assets/icons/bottom_bar/favourite_bottom_bar_ic.svg",
        color: index == 2 ? selectedMenuColor : unselectedMenuColor,
      ),
      label: "Favourites",
    );
  }

  _createPageItem(int index) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        "assets/icons/bottom_bar/create_bottom_bar_ic.svg",
        color: index == 3 ? selectedMenuColor : unselectedMenuColor,
      ),
      label: "Create",
    );
  }
}
