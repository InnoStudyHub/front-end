import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/color_codes.dart';
import '../deck_preview/deck_preview.dart';
import 'home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: controller.hasResults
              ? ListView(
                  children: [
                    Obx(
                      () => ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: controller.decks.length,
                        itemBuilder: (BuildContext context, int index) {
                          return DeckPreview(
                            deck: controller.decks[index],
                          );
                        },
                      ),
                    ),
                  ],
                )
              : const Center(
                  child: Text(
                    "There are no decks",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: selectedMenuColor,
                    ),
                  ),
                ),
        ),
      );
    });
  }
}
