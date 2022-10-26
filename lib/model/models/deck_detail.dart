import 'card.dart';

class DeckDetails{
  int id;
  int folderId;
  int authorId;
  String deckName;
  String semester;
  List<Card> cards;

  DeckDetails({
    required this.id,
    required this.folderId,
    required this.authorId,
    required this.deckName,
    required this.semester,
    required this.cards
  });

  static DeckDetails fromJson(Map<String, Object?> jsonMap){
    var cardsJson = jsonMap["cards"] as List;
    List<Card> cards = [];
    for (int i = 0; i < cardsJson.length; i++){
      cards.add(Card.fromJson(cardsJson[i]));
    }

    return DeckDetails(
        id: jsonMap["id"] as int,
        folderId: jsonMap["folder_id"] as int,
        authorId: jsonMap["author_id"] as int,
        deckName: jsonMap["deck_name"] as String,
        semester: jsonMap["semester"] as String,
        cards: cards,
    );
  }

}
