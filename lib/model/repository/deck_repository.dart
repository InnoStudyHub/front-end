import 'package:study_hub/model/models/create_deck.dart';
import 'package:study_hub/model/models/deck.dart';
import 'package:study_hub/model/models/resource.dart';

abstract class DeckRepository {
  Future<Resource<Deck>> uploadDeck(CreateDeck deck, String accessToken);
  Future<Resource<List<Deck>>> getDecks(String accessToken);
}
