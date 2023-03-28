import '../../../model/models/deck.dart';
import '../../../model/models/resource.dart';
import '../../../model/models/search_result.dart';
import '../models/folder.dart';
import '../models/search_query.dart';

abstract class DeckRepository {
  Future<Resource<List<Deck>>> getDecks();
  Future<Resource<List<Deck>>> getFavourites();
  Future<Resource<int>> addToFavourites(Deck deck);
  Future<Resource<int>> removeFromFavourites(Deck deck);
  Future<Resource<List<Folder>>> getFolderList();
  Future<Resource<SearchResult>> search(SearchQuery query);
  Future<Resource<List<Deck>>> getRecent();
  Future<Resource<int>> logDeck(int id);
  Future<Resource<List<Deck>>> getDecksFromFolder(int folderId);
  Future<Resource<String>> getAuthorName(int authorId);
  Future<Resource<List<Folder>>> getForYou();
}
