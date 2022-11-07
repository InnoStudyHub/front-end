import 'package:get/get.dart';
import '../models/deck.dart';

abstract class CachedRepository{

  RxList<Deck> get favouriteDecks;

  RxList<Deck> get myDecks;

  RxList<Deck> get recentDecks;

  void addToFavourites({required Deck deck});

  void deleteFromFavourites({required Deck deck});

  void uploadDeck({required Deck deck});

}