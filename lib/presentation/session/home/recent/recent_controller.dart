import 'package:get/get.dart';
import 'package:study_hub/domain/use_case/deck/get_recent_decks_use_case.dart';
import 'package:study_hub/model/models/deck.dart';

class RecentController extends GetxController {
  RxList<Deck> decks = RxList();

  RecentController() {
    getDecks();
  }

  void getDecks() {
    decks = GetRecentDecksUseCase.invoke();
  }
}
