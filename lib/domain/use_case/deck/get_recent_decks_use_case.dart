import 'package:get/get.dart';
import 'package:study_hub/model/repository/deck_repository.dart';
import '../../../model/models/deck.dart';
import '../../../model/models/resource.dart';

class GetRecentDecksUseCase {
  GetRecentDecksUseCase._();

  static Future<List<Deck>> invoke() async {
    DeckRepository remote = Get.find();

    var response = await remote.getRecent();
    if (response is Success) {
      return response.data!;
    }

    return [];
  }
}
