import 'package:get/get.dart';
import 'package:study_hub/model/models/deck.dart';
import 'package:study_hub/model/repository/cached_repository.dart';

class CachedRepoImpl implements CachedRepository{

  final RxList<Deck> _favouriteDecks = RxList();
  final RxList<Deck> _myDecks = RxList();
  final RxList<Deck> _recentDecks = RxList();


  @override
  RxList<Deck> get favouriteDecks => _favouriteDecks;

  @override
  RxList<Deck> get myDecks => _myDecks;

  @override
  RxList<Deck> get recentDecks => _recentDecks;

  @override
  void addToFavourites({required Deck deck}) {
    // TODO: implement addToFavourites
  }

  @override
  void deleteFromFavourites({required Deck deck}) {
    // TODO: implement deleteFromFavourites
  }

  @override
  void uploadDeck({required Deck deck}) {
    // TODO: implement uploadDeck
  }

}