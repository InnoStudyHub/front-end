import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:study_hub/model/models/create_card.dart';

class FullscreenImageCreate extends StatelessWidget {
  const FullscreenImageCreate({
    Key? key,
    required this.card,
    required this.isQuestion,
    required this.index,
    required this.update,
    required this.heroTag,
  }) : super(key: key);
  final String heroTag;
  final VoidCallback update;
  final CreateCard card;
  final bool isQuestion;
  final int index;

  @override
  Widget build(BuildContext context) {
    bool isWeb;
    String? imagePath;
    Uint8List? webImage;

    if (isQuestion) {
      isWeb = card.questionImage!.webImage != null;
      if (!isWeb) {
        imagePath = card.questionImage!.image;
      } else {
        webImage = card.questionImage!.webImage;
      }
    } else {
      isWeb = card.answerImages![index].webImage != null;
      if (!isWeb) {
        imagePath = card.answerImages![index].image;
      } else {
        webImage = card.answerImages![index].webImage;
      }
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/create_cards/delete_card.svg",
              width: 20,
              height: 20,
            ),
            onPressed: () {
              if (isQuestion) {
                card.questionImage = null;
              } else {
                card.answerImages!.removeAt(index);
              }
              update();
              Get.back();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Hero(
            tag: heroTag,
            child: Image(
              image: isWeb
                  ? MemoryImage(webImage!, scale: 1) as ImageProvider
                  : FileImage(File(imagePath!)),
            ),
          ),
        ),
      ),
    );
  }
}
