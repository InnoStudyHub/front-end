import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'favourites_controller.dart';

class FavouritesPage extends GetView<FavouritesController> {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Favourites Page"),
      ),
    );
  }
}
