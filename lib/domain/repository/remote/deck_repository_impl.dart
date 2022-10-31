import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:study_hub/common/constants.dart';
import 'package:study_hub/model/models/create_deck.dart';
import 'package:study_hub/model/models/deck.dart';
import 'package:study_hub/model/models/resource.dart';
import 'package:study_hub/model/repository/deck_repository.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class DeckRepositoryImpl implements DeckRepository {
  @override
  Future<Resource<Deck>> uploadDeck(CreateDeck deck, String accessToken) async {
    http.StreamedResponse? response;
    final url = Uri.parse("$serverIP/deck/create/");
    final data = jsonEncode(deck.toJson());

    try {
      var request = http.MultipartRequest('POST', url);
      request.headers.addAll({
        "Authorization": "Bearer $accessToken",
      });
      List<http.MultipartFile> files = await collectImages(deck);

      request.files.addAll(files);
      request.fields.addAll({"data": data.toString()});

      response = await request.send();

      if (response.statusCode != 201) {
        return Fail(
          statusCode: response.statusCode,
          errorMessage: await response.stream.bytesToString(),
        );
      }

      var deckStr = await response.stream.bytesToString();
      var newDeck = Deck.fromJson(json.decode(deckStr));

      return Success(successData: newDeck);
    } catch (error) {
      debugPrint("deck repository, uploadDeck 64. Error: ${error.toString()}");

      return Fail(errorMessage: error.toString());
    }
  }

  Future<List<http.MultipartFile>> collectImages(CreateDeck deck) async {
    List<http.MultipartFile> files = [];
    for (var card in deck.cards) {
      if (card.questionImage != null) {
        var file = await http.MultipartFile.fromPath(
          card.questionImageKey!,
          card.questionImage!,
          contentType: MediaType('image', 'jpg'),
        );
        files.add(file);
      }

      if (card.answerImages != null) {
        for (var i = 0; i < card.answerImages!.length; i++) {
          var file = await http.MultipartFile.fromPath(
            card.answerImageKeys![i],
            card.answerImages![i],
            contentType: MediaType('image', 'jpg'),
          );
          files.add(file);
        }
      }
    }

    return files;
  }

  @override
  Future<Resource<List<Deck>>> getDecks(String accessToken) async {
    final url = Uri.parse("$serverIP/user/decks/get/");
    final authCredentials = {"Authorization": "Bearer $accessToken"};
    http.Response response;

    try {
      response = await http.get(url, headers: authCredentials);
    } catch (error) {
      debugPrint("deck repository, getDecks. Error: ${error.toString()}");

      return Fail(errorMessage: error.toString());
    }

    var statusCode = response.statusCode;

    if (statusCode == 200) {
      List<Deck> decks = [];
      List decksListJson = json.decode(response.body);

      for (var deckJson in decksListJson) {
        decks.add(Deck.fromJson(deckJson));
      }

      return Success(successData: decks);
    } else {
      return Fail(errorMessage: response.body);
    }
  }
}
