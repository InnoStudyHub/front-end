import 'package:flutter/material.dart';
import 'recent_controller.dart';
import '../../deck_preview/deck_preview.dart';
import 'package:get/get.dart';

class RecentPage extends StatelessWidget {
  const RecentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<RecentController>(() => RecentController());

    return GetBuilder<RecentController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: Obx(
            () => ListView.builder(
              shrinkWrap: true,
              itemCount: controller.decks.length,
              itemBuilder: (context, index) {
                return DeckPreview(deck: controller.decks[index]);
              },
            ),
          ),
        ),
      );
    });
  }
}
