import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'settings/settings_controller.dart';

class ProfileController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void onInit() {
    Get.put<SettingsController>(SettingsController());

    tabController = TabController(vsync: this, length: 2);
    super.onInit();
  }
}
