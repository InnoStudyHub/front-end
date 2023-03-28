import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../common/constants.dart';
import '../../../model/models/deck.dart';
import '../../../model/models/folder.dart';
import '../../../model/models/resource.dart';
import '../../../model/models/search_query.dart';
import '../../../model/models/search_result.dart';
import '../../../model/repository/auth_repository.dart';
import '../../../model/repository/deck_repository.dart';

class DeckRepositoryImpl implements DeckRepository {
  final AuthRepository authRepo = Get.find();

  Future<Resource<Map<String, String>>> getAuthorizationHeader() async {
    var response = await authRepo.refresh();
    if (response is Success) {
      return Success(
        successData: {"Authorization": "Bearer ${response.data!}"},
      );
    }

    return Fail(errorMessage: "couldn't update access token");
  }

  @override
  Future<Resource<List<Deck>>> getDecks() async {
    return requestForDeck(url: Uri.parse("$serverIP/user/decks/get/"));
  }

  @override
  Future<Resource<List<Deck>>> getFavourites() {
    return requestForDeck(url: Uri.parse("$serverIP/user/favourite/get/"));
  }

  @override
  Future<Resource<List<Deck>>> getRecent() async {
    return requestForDeck(url: Uri.parse("$serverIP/user/recent/"));
  }

  @override
  Future<Resource<int>> logDeck(int id) async {
    var credentialsResponse = await getAuthorizationHeader();
    if (credentialsResponse is Fail) {
      return Fail(errorMessage: credentialsResponse.message!);
    }
    var headers = {
      "X-API-KEY": apiKey,
      "Content-Type": "application/json",
      "Origin": "http://studyhub.kz",
      'Accept': '*/*',
    };
    var credentials = credentialsResponse.data!;

    headers.addAll(credentials);
    var url = Uri.parse("$serverIP/user/log/deck/");

    var body = json.encode({"deck_id": id}).toString();
    debugPrint(body.toString());
    http.Response response;

    try {
      response = await http.post(url, headers: headers, body: body);
    } catch (e) {
      return Fail(errorMessage: e.toString());
    }

    return response.statusCode == 200
        ? Success(successData: 200)
        : Fail(errorMessage: response.body);
  }

  Future<Resource<List<Deck>>> requestForDeck({
    required Uri url,
  }) async {
    var credentialsResponse = await getAuthorizationHeader();
    if (credentialsResponse is Fail) {
      return Fail(errorMessage: credentialsResponse.message!);
    }

    var headers = {
      "X-API-KEY": apiKey,
      "Content-Type": "application/json",
      "Origin": "http://studyhub.kz",
      'Accept': '*/*',
    };
    var credentials = credentialsResponse.data!;
    headers.addAll(credentials);
    http.Response response;

    try {
      response = await http.get(url, headers: headers);
    } catch (error) {
      debugPrint("deck repository, getDecks. Error: ${error.toString()}");

      return Fail(errorMessage: error.toString());
    }

    var statusCode = response.statusCode;

    if (statusCode == 200) {
      List<Deck> decks = [];
      List decksListJson = json.decode(utf8.decode(response.bodyBytes));

      for (var i = decksListJson.length - 1; i >= 0; i--) {
        decks.add(Deck.fromJson(decksListJson[i]));
      }

      return Success(successData: decks);
    } else {
      return Fail(errorMessage: response.body);
    }
  }

  @override
  Future<Resource<int>> addToFavourites(Deck deck) async {
    var credentialsResponse = await getAuthorizationHeader();
    if (credentialsResponse is Fail) {
      return Fail(errorMessage: credentialsResponse.message!);
    }
    var headers = {
      "X-API-KEY": apiKey,
      "Content-Type": "application/json",
      "Origin": "http://studyhub.kz",
      'Accept': '*/*',
    };
    var credentials = credentialsResponse.data!;

    headers.addAll(credentials);
    var url = Uri.parse("$serverIP/user/favourite/add/");

    var body = json.encode({"deck_id": deck.id}).toString();
    debugPrint(body.toString());
    http.Response response;

    try {
      response = await http.post(url, headers: headers, body: body);
    } catch (e) {
      return Fail(errorMessage: e.toString());
    }

    int statusCode = response.statusCode;
    if (statusCode == 201) {
      debugPrint("added deck ${deck.id} to favourites");

      return Success(successData: statusCode);
    } else {
      debugPrint(
        "Couldn't add deck to favourites: $statusCode, ${response.body}",
      );
      if (statusCode == 403) {
        return Fail(errorMessage: "Deck is already in favourites");
      }

      return Fail(errorMessage: "Unexpected error");
    }
  }

  @override
  Future<Resource<int>> removeFromFavourites(Deck deck) async {
    var credentialsResponse = await getAuthorizationHeader();
    if (credentialsResponse is Fail) {
      return Fail(errorMessage: credentialsResponse.message!);
    }

    var credentials = credentialsResponse.data!;

    var headers = {
      "X-API-KEY": apiKey,
      "Content-Type": "application/json",
      "Origin": "http://studyhub.kz",
      'Accept': '*/*',
    };
    headers.addAll(credentials);
    var url = Uri.parse("$serverIP/user/favourite/remove/");

    var body = json.encode({"deck_id": deck.id}).toString();

    http.Response response;

    try {
      response = await http.post(url, headers: headers, body: body);
    } catch (e) {
      return Fail(errorMessage: e.toString());
    }

    int statusCode = response.statusCode;
    if (statusCode == 201) {
      debugPrint("removed deck ${deck.id} from favourites");

      return Success(successData: statusCode);
    } else {
      debugPrint("removed deck ${deck.id} from favourites");
      if (statusCode == 403) {
        return Fail(errorMessage: "Deck is already not favourite");
      }

      return Fail(errorMessage: "Unexpected error");
    }
  }

  @override
  Future<Resource<List<Folder>>> getFolderList() async {
    var credentialsResponse = await getAuthorizationHeader();
    if (credentialsResponse is Fail) {
      return Fail(errorMessage: credentialsResponse.message!);
    }

    var credentials = credentialsResponse.data!;

    var headers = {
      "X-API-KEY": apiKey,
      "Content-Type": "application/json",
      "Origin": "http://studyhub.kz",
      'Accept': '*/*',
    };
    headers.addAll(credentials);
    var url = Uri.parse("$serverIP/folder/list/");
    http.Response response;

    try {
      response = await http.get(url, headers: headers);
    } catch (error) {
      debugPrint("deck repository, getFolderList. Error: ${error.toString()}");

      return Fail(errorMessage: error.toString());
    }

    var statusCode = response.statusCode;

    if (statusCode == 200) {
      List<Folder> folders = [];
      List decksListJson = json.decode(response.body);
      debugPrint(response.body);

      for (var i = decksListJson.length - 1; i >= 0; i--) {
        folders.add(Folder.fromJson(decksListJson[i]));
      }

      return Success(successData: folders);
    } else {
      debugPrint(response.body);

      return Fail(errorMessage: response.body);
    }
  }

  @override
  Future<Resource<SearchResult>> search(SearchQuery query) async {
    var credentialsResponse = await getAuthorizationHeader();
    if (credentialsResponse is Fail) {
      return Fail(errorMessage: credentialsResponse.message!);
    }

    var credentials = credentialsResponse.data!;

    var headers = {
      "X-API-KEY": apiKey,
      "Content-Type": "application/json",
      "Origin": "http://studyhub.kz",
      'Accept': '*/*',
    };
    headers.addAll(credentials);
    var url = Uri.parse("$serverIP/user/search/");

    var body = json.encode(query.toJson()).toString();

    http.Response response;

    try {
      response = await http.post(url, headers: headers, body: body);
    } catch (e) {
      return Fail(errorMessage: e.toString());
    }

    int statusCode = response.statusCode;

    if (statusCode == 200) {
      var json = jsonDecode(response.body);
      SearchResult result = SearchResult.fromJson(json);

      return Success(successData: result);
    } else {
      if (statusCode == 403) {
        return Fail(errorMessage: response.body);
      }

      return Fail(errorMessage: "Unexpected error");
    }
  }

  @override
  Future<Resource<List<Deck>>> getDecksFromFolder(int folderId) async {
    return requestForDeck(
      url: Uri.parse("$serverIP/folder/get?folderId=$folderId"),
    );
  }

  @override
  Future<Resource<String>> getAuthorName(int authorId) async {
    var credentialsResponse = await getAuthorizationHeader();
    if (credentialsResponse is Fail) {
      return Fail(errorMessage: credentialsResponse.message!);
    }

    var credentials = credentialsResponse.data!;

    var headers = {
      "X-API-KEY": apiKey,
      "Content-Type": "application/json",
      "Origin": "http://studyhub.kz",
      'Accept': '*/*',
    };
    headers.addAll(credentials);
    var url = Uri.parse("$serverIP/user/info?userId=$authorId");

    http.Response response;

    try {
      response = await http.get(url, headers: headers);
    } catch (error) {
      return Fail(errorMessage: error.toString());
    }

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body) as Map<String, Object?>;

      return Success(successData: json["fullname"] as String);
    }

    return Fail(errorMessage: response.body);
  }

  @override
  Future<Resource<List<Folder>>> getForYou() async {
    var credentialsResponse = await getAuthorizationHeader();
    if (credentialsResponse is Fail) {
      return Fail(errorMessage: credentialsResponse.message!);
    }

    var credentials = credentialsResponse.data!;

    var headers = {
      "X-API-KEY": apiKey,
      "Content-Type": "application/json",
      "Origin": "http://studyhub.kz",
      'Accept': '*/*',
    };
    headers.addAll(credentials);
    var url = Uri.parse("$serverIP/user/forYou/");
    http.Response response;

    try {
      response = await http.get(url, headers: headers);
    } catch (error) {
      debugPrint("deck repository, getForYou. Error: ${error.toString()}");

      return Fail(errorMessage: error.toString());
    }

    var statusCode = response.statusCode;

    if (statusCode == 200) {
      List<Folder> folders = [];
      List decksListJson = json.decode(response.body);
      debugPrint(response.body);

      for (var i = decksListJson.length - 1; i >= 0; i--) {
        folders.add(Folder.fromJson(decksListJson[i]));
      }

      return Success(successData: folders);
    } else {
      debugPrint(response.body);

      return Fail(errorMessage: response.body);
    }
  }
}
