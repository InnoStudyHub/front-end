import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              ],
            ),
          ),
        ),
        body: TabBarView(
          controller: controller.tabController,
          children: const <Widget>[
            ForYouPage(),
          ],
        ),
      );
    });
  }
}
