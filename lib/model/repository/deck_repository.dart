import 'package:study_hub/model/models/create_deck.dart';
import 'package:study_hub/model/models/resource.dart';

abstract class DeckRepository {
  Future<Resource<void>> uploadDeck(CreateDeck deck, String accessToken);
}
