import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'single_card_view.dart';


class AddCardsController extends GetxController{

  List<Widget> cardViews = [];

  List<TextEditingController> questionControllers = [];
  List<String> questions = [];
  List<String?> questionErrors = [];

  List<TextEditingController> answerControllers = [];
  List<String?> answers = [];

  void addCard(){
    questionControllers.add(TextEditingController());
    answerControllers.add(TextEditingController());
    questions.add("");
    questionErrors.add(null);
    answers.add(null);

    questionControllers.last.addListener(() {
      questions.last = questionControllers.last.text.toString();
      debugPrint("${questions.last} ${questions.indexOf(questions.last)}");
      questionErrors.last = null;
      update();
    });

    answerControllers.last.addListener(() {
      answers.last = answerControllers.last.text;
      debugPrint(answers.last);
    });

    cardViews.add(
      singleCardView(
        questionController: questionControllers.last,
        answerController: answerControllers.last,
        questionError: questionErrors.last,
      )
    );

    update();
  }

  void validateAll(){
    for (int i = 0; i < cardViews.length; i++){
      validateForm(i);
      update();
    }
  }

  AddCardsController(){
    addCard();
  }

  void validateForm(int i){
    if (questions[i].isEmpty){
      questionErrors[i] = "Question must not be empty";
      debugPrint("$i, ${questionErrors[i]}");
    }
  }
}
