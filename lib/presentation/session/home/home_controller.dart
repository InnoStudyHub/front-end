import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'for_you/for_you_controller.dart';
import 'recent/recent_controller.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: 2);
    Get.lazyPut<RecentController>(() => RecentController());
    Get.lazyPut<ForYouController>(() => ForYouController());

    super.onInit();
  }
}
