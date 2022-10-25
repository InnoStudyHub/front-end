import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_hub/model/models/create_card.dart';
import 'package:study_hub/model/models/create_deck.dart';
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

  void validateAll() {
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
      debugPrint("add_cards_controller ${cardModels.toString()}");
      deck.cards = cardModels;
    }
  }

  bool isFormValid(int i) {
    return cardModels[i].isValid();
  }

  void deleteCard(int i) {
    cardModels.removeAt(i);
    update();
  }

  void finish() async {
    validateAll();
    var token =
        await authRepo.login(email: "dias@pivas.com", password: "password");
    var accessToken = token.data?.accessToken;
    debugPrint("add_cards_controller, finish : ${deck.cards.toString()}");
    await deckRepo.uploadDeck(deck, accessToken!);
  }
}
