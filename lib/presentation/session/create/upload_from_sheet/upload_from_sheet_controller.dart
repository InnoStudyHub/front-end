import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:study_hub/model/models/create_deck.dart';

class UploadFromSheetController extends GetxController {
  CreateDeck deck;
  var _link = "";
  String? linkError;
  TextEditingController linkController = TextEditingController();

  UploadFromSheetController(this.deck) {
    linkController.addListener(() {
      _link = linkController.text.toString();
      linkError = null;
      update();
    });
  }

  void upload() {
    if (_link.isEmpty) {
      linkError = "Link to the sheet cannot be empty";

      return;
    }
  }
}