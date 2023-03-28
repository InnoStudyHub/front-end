import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'favourites/favourites_controller.dart';
import 'settings/settings_controller.dart';

class ProfileController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void onInit() {
    Get.put<SettingsController>(SettingsController());
    Get.put<FavouritesController>(FavouritesController());

    tabController = TabController(vsync: this, length: 2);
    super.onInit();
  }
}
