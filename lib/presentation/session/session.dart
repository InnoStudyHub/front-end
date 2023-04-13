import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:study_hub/presentation/session/settings/setting_page.dart';
import '../util/color_codes.dart';
import 'home/home_page.dart';
import 'search/search_page.dart';
import 'session_controller.dart';

class Session extends StatelessWidget {
  const Session({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SessionController>(builder: (controller) {
      return Scaffold(
        appBar: _appBar(controller),
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: const [
              HomePage(),
              SearchPage(),
              SettingsPage(),
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
            _searchPageItem(controller.tabIndex),
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

  _searchPageItem(int index) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        "assets/icons/bottom_bar/create_bottom_bar_ic.svg",
        color: index == 1 ? selectedMenuColor : unselectedMenuColor,
      ),
      // TODO change search assert
      label: "Search",
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

  AppBar _appBar(SessionController controller) {
    return AppBar(
      title: Text(controller.tabTitle),
      elevation: 0,
    );
  }
}
