import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'recent/recent_page.dart';
import '../../util/color_codes.dart';
import 'for_you/for_you_page.dart';
import 'home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: backgroundDarkBlue,
          flexibleSpace: SafeArea(
            child: TabBar(
              isScrollable: true,
              controller: controller.tabController,
              labelColor: selectedTabColor,
              unselectedLabelColor: unselectedTabColor,
              indicatorColor: selectedTabColor,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: const [
                Tab(text: 'Recent'),
                Tab(text: 'For You'),
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
}
