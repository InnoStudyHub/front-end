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
  Future<Resource<Deck>> uploadDeck(
      CreateDeck deck, String accessToken) async {
    http.StreamedResponse? response;
    final url = Uri.parse("$serverIP/deck/create/");
    final data = jsonEncode(deck.toJson());

    try {
      var request = http.MultipartRequest('POST', url);
      request.headers.addAll({
        "Authorization": "Bearer $accessToken",
      });
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

      request.files.addAll(files);
      request.fields.addAll({"data": data.toString()});

      response = await request.send();

      if (response.statusCode != 201) {
        return Resource(
            errorCode: response.statusCode, message: "Error uploading deck");
      }

      var deckStr = await response.stream.bytesToString();
      var newDeck = Deck.fromJson(json.decode(deckStr));
      return Resource(data: newDeck);
    } catch (error) {
      debugPrint("deck repository, uploadDeck 64. Error: ${error.toString()}");
    }
    return Resource(data: null);
  }
}
