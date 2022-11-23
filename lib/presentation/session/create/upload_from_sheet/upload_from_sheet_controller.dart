import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UploadFromSheetController extends GetxController {
  var _link = "";
  String? linkError;
  TextEditingController linkController = TextEditingController();

  UploadFromSheetController() {
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