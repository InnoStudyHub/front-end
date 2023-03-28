import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/color_codes.dart';
import 'favourites/favourites_page.dart';
import 'profile_controller.dart';
import 'settings/setting_page.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainAppColor,
        flexibleSpace: SafeArea(
          child: TabBar(
            controller: controller.tabController,
            labelColor: selectedTabColor,
            unselectedLabelColor: unselectedTabColor,
            indicatorColor: selectedTabColor,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: const [
              Tab(text: "Favourites"),
              Tab(text: 'Settings'),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: const <Widget>[
          FavouritesPage(),
          SettingsPage(),
        ],
      ),
    );
  }
}
