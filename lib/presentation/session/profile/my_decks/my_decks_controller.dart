import 'package:get/get.dart';
import '../../../../model/repository/auth_repository.dart';
import '../../../../model/models/deck.dart';
import '../../../../model/repository/deck_repository.dart';
import '../../../../domain/use_case/deck/get_my_decks_use_case.dart';

class MyDecksController extends GetxController {
  final DeckRepository decksRepo = Get.find();
  final AuthRepository authRepo = Get.find();

  RxList<Deck> decks = RxList();

  MyDecksController() {
    getDecks();
  }

  void getDecks() {
    decks = GetMyDecksUseCase.invoke();
  }
}
