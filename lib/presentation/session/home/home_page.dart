import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return const Scaffold(
        body: Center(
          child: Text(
            "Здесь должен быть список дек",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );
    });
  }
}
