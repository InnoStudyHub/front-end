import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/color_codes.dart';
import '../../../widgets/loading_indicator.dart';
import '../../deck_preview/deck_preview.dart';
import 'favourites_controller.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavouritesController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: controller.isLoading
              ? const LoadingIndicator()
              : Obx(
                  () => controller.decks.isEmpty
                      ? const Center(
                          child: Text(
                            "You have no favourite decks",
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
                            return DeckPreview(
                              deck: controller.decks[index],
                            );
                          },
                        ),
                ),
        ),
      );
    });
  }
}
