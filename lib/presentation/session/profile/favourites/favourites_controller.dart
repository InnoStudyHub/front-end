import 'package:get/get.dart';
import '../../../../model/models/deck.dart';
import '../../../../domain/use_case/deck/get_favourites_use_case.dart';

class FavouritesController extends GetxController {
  RxList<Deck> decks = RxList();

  FavouritesController() {
    getDecks();
  }

  void getDecks() {
    decks = GetFavouritesUseCase.invoke();
  }
}
