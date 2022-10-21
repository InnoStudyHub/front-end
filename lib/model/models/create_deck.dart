import 'create_card.dart';

class CreateDeck {
  final String deckName;
  final String materialSemester;
  final List<CreateCard> cards;

  CreateDeck(
      {required this.deckName,
      required this.materialSemester,
      required this.cards});
}
