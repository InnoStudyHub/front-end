import 'package:get/get.dart';
import 'package:study_hub/model/models/deck.dart';
import 'package:study_hub/model/repository/cached_repository.dart';
import 'package:study_hub/model/repository/deck_repository.dart';
import '../../../model/models/resource.dart';

class CachedRepoImpl implements CachedRepository {
  final DeckRepository remote = Get.find();
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

  @override
  Future<void> updateMyDecks() async {
    var response = await remote.getDecks("accessToken");
    if (response is Success) {
      for (var deck in response.data!) {
        _myDecks.add(deck);
      }
    }
  }

  @override
  Future<void> updateFavourites() async {
    var response = await remote.getFavourites("accessToken");
    if (response is Success) {
      for (var deck in response.data!) {
        _favouriteDecks.add(deck);
      }
    }
  }
}
