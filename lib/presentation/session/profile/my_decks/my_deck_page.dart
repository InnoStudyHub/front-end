import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../util/color_codes.dart';
import 'my_decks_controller.dart';

class MyDecksPage extends StatelessWidget {
  const MyDecksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<MyDecksController>(() => MyDecksController());

    return GetBuilder<MyDecksController>(builder: (controller) {
      return const Scaffold(
        body: Center(
          child: Text(
            'MyDecksPage content',
            style: TextStyle(color: unselectedTabColor),
          ),
        ),
      );
    });
  }
}
