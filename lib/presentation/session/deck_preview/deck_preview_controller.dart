import 'package:get/get.dart';
import 'package:study_hub/model/repository/deck_repository.dart';
import 'package:study_hub/model/models/deck.dart';
import '../../../domain/use_case/deck/add_to_favourites_use_case.dart';
import '../../../domain/use_case/deck/remove_from_favourites_use_case.dart';

class DeckPreviewController extends GetxController {
  final DeckRepository deckRepo = Get.find();

  void addDeckToFavourites(Deck deck) {
    AddToFavouritesUseCase.invoke(deck);
    update();
  }

  void removeDeckFromFavourites(Deck deck) {
    RemoveFromFavouritesUseCase.invoke(deck);
    update();
  }
}
