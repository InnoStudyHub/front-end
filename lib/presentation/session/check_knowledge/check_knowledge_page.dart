import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:study_hub/presentation/session/check_knowledge/card/flip_card.dart';
import 'package:study_hub/presentation/session/check_knowledge/check_knowledge_controller.dart';
import 'package:swipable_stack/swipable_stack.dart';

import '../../../model/models/card.dart' as card;
import '../../util/color_codes.dart';

class CheckKnowledgePage extends StatelessWidget {
  final List<card.Card> cards;

  CheckKnowledgePage({required this.cards, Key? key}) : super(key: key);

  final swipeController = SwipableStackController();

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<CheckKnowledgeController>(() => CheckKnowledgeController());

    return GetBuilder<CheckKnowledgeController>(builder: (controller) {
      swipeController.addListener(controller.update);

      return Scaffold(
        body: SafeArea(
          child: kIsWeb
              ? _webCheckKnowledgePage(swipeController)
              : Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _header(),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                height: 360,
                width: Get.width,
                child: Stack(
                  children: [
                    SwipableStack(
                      detectableSwipeDirections: const {
                        SwipeDirection.right,
                        SwipeDirection.left,
                      },
                      stackClipBehaviour: Clip.none,
                      controller: swipeController,
                      horizontalSwipeThreshold: 0.5,
                      verticalSwipeThreshold: 0.5,
                      itemCount: cards.length,
                      builder: (context, properties) {
                        final itemIndex = properties.index % cards.length;

                        return FlipCard(card: cards[itemIndex]);
                      },
                    ),
                    if (swipeController.currentIndex == cards.length)
                      Center(
                        child: _end(),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      );
    });
  }

  Widget _header() {
    int cur = swipeController.currentIndex >= cards.length
        ? cards.length
        : swipeController.currentIndex + 1;
    double progress = cur.toDouble() / cards.length;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _cancelButton(),
            _numberOfCards(),
            _restartButton(),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: LinearPercentIndicator(
            lineHeight: 8,
            progressColor: selectedTabColor,
            backgroundColor: darkCard,
            barRadius: const Radius.circular(2),
            percent: progress,
          ),
        ),
      ],
    );
  }

  Widget _cancelButton() {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 20),
      child: Align(
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            IconButton(
              iconSize: 20,
              onPressed: () {
                Get.back();
              },
              icon: SvgPicture.asset(
                "assets/icons/deck_view/close.svg",
              ),
            ),
            kIsWeb ? _webDeckName() : null,
          ],
        ),
      ),
    );
  }

  Widget _numberOfCards() {
    int cur = swipeController.currentIndex >= cards.length
        ? cards.length
        : swipeController.currentIndex + 1;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Text(
        "$cur/${cards.length}",
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          color: selectedMenuColor,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _restartButton() {
    return Container(
      margin: const EdgeInsets.only(right: 20, top: 20),
      child: Align(
        alignment: Alignment.topLeft,
        child: IconButton(
          iconSize: 20,
          onPressed: () {
            swipeController.currentIndex = 0;
          },
          icon: SvgPicture.asset(
            "assets/icons/deck_view/restart.svg",
          ),
        ),
      ),
    );
  }

  Widget _end() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          child: const Text(
            "The End",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: selectedMenuColor,
            ),
          ),
        ),
        const Text(
          "You have finished the deck!",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: greySecondary,
          ),
        ),
      ],
    );
  }

  _webCheckKnowledgePage(SwipableStackController swipeController) {
    return Container(
      margin: const EdgeInsets.fromLTRB(90, 15, 105, 20),
      child: Column(
        children: [
          _header(),
          const SizedBox(height: 40),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 60, right: 20),
                height: 550,
                width: 1100,
                child: Stack(
                  children: [
                    SwipableStack(
                      detectableSwipeDirections: const {
                        SwipeDirection.right,
                        SwipeDirection.left,
                      },
                      stackClipBehaviour: Clip.none,
                      controller: swipeController,
                      horizontalSwipeThreshold: 0.5,
                      verticalSwipeThreshold: 0.5,
                      itemCount: cards.length,
                      builder: (context, properties) {
                        final itemIndex = properties.index % cards.length;

                        return FlipCard(card: cards[itemIndex]);
                      },
                    ),
                    if (swipeController.currentIndex == cards.length)
                      Center(
                        child: _end(),
                      ),
                  ],
                ),
              ),
              _webNextButton(),
            ],
          ),
          _tapOnCardText(),
        ],
      ),
    );
  }

  _webDeckName() {
    return const Text(
      // TODO get deck name from card
      "There should be deck's name",
      style: TextStyle(
        color: selectedMenuColor,
        fontSize: 20,
      ),
    );
  }

  _webNextButton() {
    return Container(
      height: 550,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Container()),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 30, 20, 0),
            height: 44,
            width: 320,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: backgroundDarkBlue,
                side: const BorderSide(
                  color: mainAppColor,
                ),
              ),
              onPressed: () {
                //TODO
              },
              child: const Text(
                "Next",
                style: TextStyle(
                  color: selectedMenuColor,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _tapOnCardText() {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 450,),
      child: Align(
        alignment: Alignment.centerLeft,
        child: const Text(
          "Tap on the card to flip it",
          style: TextStyle(
            color: unselectedTabColor,
            fontSize: 18,
          ),),
      ),
    );
  }
}
