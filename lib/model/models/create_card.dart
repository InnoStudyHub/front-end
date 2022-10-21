import 'dart:io';

class CreateCard {
  final String question;
  final String? answer;
  final File? questionImage;
  final String? questionImageKey;
  final List<File>? answerImages;
  final List<String>? answerImageKeys;

  CreateCard(
      {required this.question,
      this.answer,
      this.questionImage,
      this.questionImageKey,
      this.answerImages,
      this.answerImageKeys});
}
