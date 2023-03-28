import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../util/color_codes.dart';
import 'home/home_page.dart';
import 'home/search/search_page.dart';
import 'profile/profile_page.dart';
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
      actions: [
        if (controller.tabTitle == "Home")
          IconButton(
            onPressed: () {
              Get.to(() => const SearchPage());
            },
            icon: const Icon(Icons.search, color: greySecondary),
          ),
        if (controller.tabTitle == "Profile")
          IconButton(
            onPressed: () {
              Get.defaultDialog(
                barrierDismissible: true,
                radius: 6,
                contentPadding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                titlePadding: const EdgeInsets.only(top: 20),
                title: "Support",
                titleStyle: const TextStyle(color: selectedMenuColor),
                middleTextStyle: const TextStyle(color: greySecondary),
                middleText:
                    "Have any questions or suggestions? Write us on telegram!",
                textConfirm: "Send message",
                backgroundColor: backgroundDarkBlue,
                confirmTextColor: selectedMenuColor,
                buttonColor: selectedTabColor,
                onConfirm: () async {
                  await launchUrl(
                    Uri.parse("https://t.me/dionyusus"),
                    mode: LaunchMode.externalApplication,
                  );
                },
              );
            },
            icon: const Icon(Icons.info_outline_rounded, color: greySecondary),
          ),
      ],
      elevation: 0,
    );
  }
}
