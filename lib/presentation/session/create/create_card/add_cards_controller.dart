import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_hub/model/models/create_card.dart';
import 'package:study_hub/model/models/create_deck.dart';
import 'package:study_hub/model/models/resource.dart';
import 'package:study_hub/model/repository/auth_repository.dart';
import 'package:study_hub/model/repository/deck_repository.dart';

class AddCardsController extends GetxController {
  CreateDeck deck;

  AddCardsController(this.deck) {
    addCard();
  }

  final deckRepo = Get.find<DeckRepository>();
  final authRepo = Get.find<AuthRepository>();
  List<CreateCard> cardModels = [];

  void addCard() {
    cardModels.add(CreateCard(this));
    update();
  }

  bool validateAll() {
    bool isValid = true;

    for (int i = 0; i < cardModels.length; i++) {
      if (!isFormValid(i)) {
        debugPrint("add_cards_controller Form is not valid");
        isValid = false;
        break;
      }
      update();
    }
    if (isValid) {
      deck.cards = cardModels;

      return true;
    }

    return false;
  }

  bool isFormValid(int i) {
    return cardModels[i].isValid();
  }

  void deleteCard(CreateCard card) {
    cardModels.remove(card);
    update();
  }

  void finish() async {
    if (!validateAll()) return;

    var accessToken = await authRepo.refresh();
    //TODO: error handling
    if (accessToken is Fail) return;

    await deckRepo.uploadDeck(deck, accessToken.data!);
  }
}
