import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:study_hub/model/models/deck.dart';
import 'package:study_hub/presentation/util/color_codes.dart';
import 'package:study_hub/presentation/widgets/themed_material_button.dart';

import 'deck_view_controller.dart';

class DeckViewPage extends StatelessWidget {
  final Deck deck;
  const DeckViewPage({required this.deck, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<DeckViewController>(() => DeckViewController());

    return GetBuilder<DeckViewController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(deck.deckName),
            elevation: 0,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _infoField(
                asset: "assets/icons/deck_view/folder.svg",
                text: deck.folderName,
              ),
              _infoField(
                asset: "assets/icons/deck_view/user.svg",
                text: deck.authorId.toString(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _infoField(
                    asset: "assets/icons/deck_view/year.svg",
                    text: deck.semester,
                  ),
                  _numberOfCards(),
                ],
              ),
              Container(
                height: 300,
                margin: const EdgeInsets.only(top: 35, left: 20),
                child: cards(),
              ),
              Expanded(child: Container()),
              ThemedMaterialButton(
                text: "Check knowledge",
                callback: () {
                  //TODO
                },
                color: selectedTabColor,
              ),
              ThemedMaterialButton(
                text: "Study Material",
                callback: () {
                  //TODO
                },
                color: purpleAppColor,
              ),
              SizedBox(
                height: 30,
                child: Container(),
              ),
            ],
          ),
        ),
      );
    });
  }

  final TextStyle defaultStyle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: greySecondary,
  );

  Widget _infoField({
    required String asset,
    required String text,
  }) {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 20),
      child: Row(
        children: [
          SvgPicture.asset(
            asset,
            height: 20,
            width: 20,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Text(
              text,
              style: defaultStyle,
            ),
          ),
        ],
      ),
    );
  }

  Widget _numberOfCards() {
    return Container(
      margin: const EdgeInsets.only(right: 20, top: 20),
      decoration: BoxDecoration(
        border: Border.all(color: greySecondary),
        borderRadius: BorderRadius.circular(3),
      ),
      padding: const EdgeInsets.fromLTRB(2, 4, 2, 4),
      child: Text(
        "${deck.cards.length} cards",
        style: const TextStyle(
          color: greySecondary,
          fontSize: 12,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget cards() {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: deck.cards.length,
      itemBuilder: (context, index) {
        return Container(
          height: 200,
          width: 300,
          color: darkCard,
          margin: const EdgeInsets.only(right: 20),
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Text(
              deck.cards[index].question,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        );
      },
    );
  }
}
