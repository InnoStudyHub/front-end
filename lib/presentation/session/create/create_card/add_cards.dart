import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../create_card/add_cards_controller.dart';
import '../../../util/color_codes.dart';

class AddCardsPage extends StatelessWidget {
  const AddCardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddCardsController>(builder: (controller){
      return Scaffold(
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              Column(children: controller.cardViews),
              _addButton(controller),
              _finishButton(controller),
            ],
          ),
        ),
      );
    });
  }

  Widget _addButton(AddCardsController controller) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 30, 20, 0),
      height: 60,
      child: MaterialButton(
        onPressed: () {controller.addCard();},
        color: mainAppColor,
        child: const Icon(
          Icons.add,
          color: selectedMenuColor,
        ),
      ),
    );
  }

  Widget _finishButton(AddCardsController controller) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 30, 20, 0),
      height: 60,
      child: MaterialButton(
        onPressed: () {
          controller.validateAll();
          controller.update();
        },
        color: selectedTabColor,
        child: const Text(
          "Finish",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
