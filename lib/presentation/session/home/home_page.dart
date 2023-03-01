import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_hub/presentation/session/home/search/search_page.dart';
import 'recent/recent_page.dart';
import '../../util/color_codes.dart';
import 'for_you/for_you_page.dart';
import 'home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return kIsWeb
          ? _webHomePage(controller)
          : Scaffold(
              appBar: AppBar(
                backgroundColor: mainAppColor,
                flexibleSpace: SafeArea(
                  child: TabBar(
                    isScrollable: false,
                    controller: controller.tabController,
                    labelColor: selectedTabColor,
                    unselectedLabelColor: unselectedTabColor,
                    indicatorColor: selectedTabColor,
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: const [
                      Tab(text: 'For You'),
                      Tab(text: 'Recent'),
                    ],
                  ),
                ),
              ),
              body: TabBarView(
                controller: controller.tabController,
                children: const <Widget>[
                  ForYouPage(),
                  RecentPage(),
                ],
              ),
            );
    });
  }

  _webHomePage(HomeController controller) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: backgroundDarkBlue,
        flexibleSpace: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(left: 105),
            child: TabBar(
              isScrollable: true,
              controller: controller.tabController,
              labelColor: selectedTabColor,
              unselectedLabelColor: unselectedTabColor,
              indicatorColor: selectedTabColor,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: const [
                Tab(text: 'For You'),
                Tab(text: 'Recent'),
                Tab(text: 'Search'),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: const <Widget>[
          ForYouPage(),
          RecentPage(),
          SearchPage(),
        ],
      ),
    );
  }
}
