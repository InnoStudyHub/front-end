import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_hub/presentation/session/home/search/search_controller.dart';
import 'for_you/for_you_controller.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: 3);
    Get.put<ForYouController>(ForYouController());
    Get.put<SearchController>(SearchController());

    super.onInit();
  }
}
