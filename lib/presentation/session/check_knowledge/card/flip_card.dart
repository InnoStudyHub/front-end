import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_hub/presentation/util/color_codes.dart';
import '../../../../model/models/card.dart' as c;
import 'flip_card_controller.dart';

class FlipCard extends StatelessWidget {
  final c.Card card;
  const FlipCard({required this.card, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<FlipCardController>(() => FlipCardController());
    double angle = 0;
    bool isFront = true;

    return GetBuilder<FlipCardController>(builder: (controller) {
      void flip() {
        isFront = !isFront;
        angle = (angle + pi) % (2 * pi);
        controller.update();
      }

      return GestureDetector(
        onTap: flip,
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: angle),
          duration: const Duration(milliseconds: 300),
          builder: (BuildContext context, double val, __) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(val),
              child: isFront ? _front() : _back(),
            );
          },
        ),
      );
    });
  }

  Widget _front() {
    return Container(
      height: 350,
      width: double.infinity,
      decoration: BoxDecoration(
        color: darkCard,
        borderRadius: BorderRadius.circular(3),
      ),
      child: const Text("Front"),
    );
  }

  Widget _back() {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()..rotateY(pi),
      child: Container(
        height: 350,
        width: double.infinity,
        decoration: BoxDecoration(
          color: darkCard,
          borderRadius: BorderRadius.circular(3),
        ),
        child: const Text("Back"),
      ),
    );
  }
}
