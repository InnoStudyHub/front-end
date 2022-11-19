import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_hub/presentation/session/deck_preview/deck_preview.dart';

import '../../deck_preview/web_deck_preview.dart';
import 'my_decks_controller.dart';

class MyDecksPage extends StatelessWidget {
  const MyDecksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetBuilder<MyDecksController>(builder: (controller) {
      return kIsWeb
          ? _web(controller)
          : Scaffold(
              body: Center(
                child: controller.decks == null
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: controller.decks!.length,
                        itemBuilder: (context, index) {
                          return DeckPreview(deck: controller.decks![index]);
                        },
                      ),
              ),
            );
    });
  }

  _web(MyDecksController controller) {
    return Scaffold(
      body: controller.decks == null
          ? const Center(child: CircularProgressIndicator())
          : Container(
              margin: const EdgeInsets.fromLTRB(108, 40, 102, 5),
              child:
              /*ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: controller.decks!.length,
                itemBuilder: (context, index) {
                  return DeckPreview(deck: controller.decks![index]);
                },
              ),*/
              GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemCount: controller.decks!.length,
                itemBuilder: (context, index) {
                  return WebDeckPreview(deck: controller.decks![index]);
                },
              ),
            ),
    );
  }
}
