import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_hub/presentation/session/profile/groups/groups_page.dart';
import '../../util/color_codes.dart';
import 'history/history_page.dart';
import 'my_decks/my_deck_page.dart';
import 'profile_controller.dart';
import 'settings/setting_page.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kIsWeb ? backgroundDarkBlue : mainAppColor,
        elevation: kIsWeb ? 0.0 : null,
        flexibleSpace: SafeArea(
          child: Container(
            margin: kIsWeb ? const EdgeInsets.only(left: 105) : null,
            child: TabBar(
              isScrollable: kIsWeb ? true : false,
              controller: controller.tabController,
              labelColor: selectedTabColor,
              unselectedLabelColor: unselectedTabColor,
              indicatorColor: selectedTabColor,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: const [
                Tab(text: 'Groups'),
                Tab(text: "My Decks"),
                Tab(text: 'History'),
                Tab(text: 'Settings'),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: const <Widget>[
          GroupsPage(),
          //FavouritesPage(),
          MyDecksPage(),
          HistoryPage(),
          //NotificationsPage(),
          SettingsPage(),
        ],
      ),
    );
  }
}
