import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../session/deck_preview/deck_preview.dart';
import 'my_decks_controller.dart';
import '../../../util/color_codes.dart';

class MyDecksPage extends StatelessWidget {
  const MyDecksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return GetBuilder<MyDecksController>(builder: (controller) {
      return kIsWeb
          ? _web(controller, screenSize)
          : Scaffold(
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

  _web(MyDecksController controller, Size screenSize) {
    return Scaffold(
      body: controller.decks.isEmpty
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
          : Column(
              children: [
                _webSearchBar(),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(108, 40, 102, 5),
                    child: DynamicHeightGridView(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      /*gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio:
                  screenSize.width / screenSize.height * 1.4,
                ),*/
                      crossAxisCount: screenSize.width > 1500
                          ? 4
                          : screenSize.width > 1300
                              ? 3
                              : screenSize.width > 1000
                                  ? 2
                                  : 1,
                      itemCount: controller.decks.length,
                      builder: (context, index) {
                        return DeckPreview(deck: controller.decks[index]);
                      },
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _webSearchBar() {
    return Container(
      margin: const EdgeInsets.only(
        right: 400,
        top: 20,
        left: 128,
      ),
      height: 48,
      child: TextField(
        onChanged: (value) => {},
        decoration: const InputDecoration(
          filled: true,
          fillColor: mainAppColor,
          border: OutlineInputBorder(borderSide: BorderSide.none),
          hintStyle: TextStyle(fontSize: 16, color: unselectedTabColor),
          hintText: "Search for a deck or course",
          prefixIcon: Icon(Icons.search, color: greySecondary),
          suffixIcon: Icon(Icons.filter_alt_outlined, color: greySecondary),
        ),
        style: const TextStyle(fontSize: 18, color: greySecondary),
        cursorColor: greySecondary,
      ),
    );
  }
}
