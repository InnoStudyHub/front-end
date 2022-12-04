import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../session/deck_preview/deck_preview.dart';
import 'my_decks_controller.dart';
import '../../../util/color_codes.dart';

class MyDecksPage extends StatelessWidget {
  const MyDecksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyDecksController>(builder: (controller) {
      return Scaffold(
        body: Obx(
          () => controller.decks.isEmpty
              ? const Center(
                  child: Text(
                    "You have no decks.\nPerfect time to create one",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: selectedMenuColor,
                    ),
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.decks.length,
                  itemBuilder: (context, index) {
                    return DeckPreview(deck: controller.decks[index]);
                  },
                ),
        ),
      );
    });
  }
}
