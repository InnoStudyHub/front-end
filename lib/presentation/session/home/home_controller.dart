import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../model/repository/deck_repository.dart';
import '../../../model/models/deck.dart';
import '../../util/color_codes.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  DeckRepository deckRepo = Get.find<DeckRepository>();

  RxList<Deck> decks = RxList();

  bool hasResults = false;

  void getDecks() async {
    showLoadingIndicator();
    var response = await deckRepo.getDecks();
    Navigator.of(Get.overlayContext!).pop();

    decks.value = response.data!;
    hasResults = (decks.isNotEmpty);
    update();
  }

  void showLoadingIndicator() {
    Get.dialog(
      const AlertDialog(
        backgroundColor: mainAppColor,
        content: SizedBox(
          height: 50,
          child: Center(
            child: CircularProgressIndicator(color: selectedTabColor),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: 3);
    getDecks();
    super.onInit();
  }
}
