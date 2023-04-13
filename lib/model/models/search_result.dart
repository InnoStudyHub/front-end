import 'deck.dart';

class SearchResult {
  final List<Deck> decks;

  SearchResult({required this.decks});

  static SearchResult fromJson(Map<String, Object?> json) {
    List<Deck> decks = [];

    for (var deck in json["decks"] as List<dynamic>) {
      decks.add(Deck.fromJson(deck as Map<String, Object?>));
    }

    return SearchResult(decks: decks);
  }
}
