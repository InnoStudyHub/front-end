import 'package:flutter/material.dart';
import '../../util/color_codes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: const Center(
        child: Text(
          "Home Page",
          style: TextStyle(color: unselectedTabColor),
        ),
      ),
    );
  }
}
