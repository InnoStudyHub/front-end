import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../util/color_codes.dart';
import 'create/create_deck_page.dart';
import 'home/home_page.dart';
import 'profile/profile_page.dart';
import 'session_controller.dart';

class Session extends StatelessWidget {
  const Session({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return GetBuilder<SessionController>(builder: (controller) {
      return Scaffold(
        appBar: PreferredSize(
          //TODO это верхняя часть экрана, которая над tabbar-ом
          //TODO нужно при нажатии на них открываться нужная страница. Тут нужно пошаманить с контроллерами. Я старался, но не получилось
          //TODO Если нажмешь на bottombar кнопки то страница будет меняться, как и цвет верхних кнопок
          preferredSize: Size(screenSize.width, 60),
          child: Container(
            color: mainAppColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.5),
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: screenSize.width * 0.35),
                    InkWell(
                      onTap: () {
                        //TODO
                      },
                      child: Text(
                        'Home',
                        style: TextStyle(
                          color: controller.tabIndex == 0
                              ? selectedMenuColor
                              : unselectedTabColor,
                          fontSize: 20,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                    SizedBox(width: screenSize.width * 0.11),
                    InkWell(
                      onTap: () {
                        //TODO
                      },
                      child: Text(
                        'Create',
                        style: TextStyle(
                          color: controller.tabIndex == 1
                              ? selectedMenuColor
                              : unselectedTabColor,
                          fontSize: 20,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                    SizedBox(width: screenSize.width * 0.11),
                    InkWell(
                      onTap: () {
                        //TODO
                      },
                      child: Text(
                        'Profile',
                        style: TextStyle(
                          color: controller.tabIndex == 2
                              ? selectedMenuColor
                              : unselectedTabColor,
                          fontSize: 20,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
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
}
