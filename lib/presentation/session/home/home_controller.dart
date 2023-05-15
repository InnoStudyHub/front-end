import 'package:get/get.dart';

import '../../../../model/repository/deck_repository.dart';
import '../../../model/models/deck.dart';
import '../../../model/models/resource.dart';
import '../../../model/models/search_query.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  DeckRepository deckRepo = Get.find<DeckRepository>();

  RxList<Deck> decks = RxList();

  bool hasResults = false;

  void getDecks() async {
    var response = await deckRepo.search(SearchQuery(query: ""));

    if (response is Success) {
      decks.value = response.data!.decks;
      hasResults = (decks.isNotEmpty);
      update();
    }
  }

  @override
  void onInit() {
    getDecks();
    super.onInit();
  }
}
