import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../../util/color_codes.dart';
import '../../util/routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          // TODO не центрится идеально по центру. Даже если убрать bottom
          // TODO из _textAndButtons() и _welcomeImage()
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _textAndButtons(),
              const SizedBox(width: 23),
              _welcomeImage(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textAndButtons() {
    return Container(
      width: 510,
      margin: const EdgeInsets.only(top: 150.0, bottom: 150.0, left: 194.0),
      child: Column(
        children: <Widget>[
          _textTitleAndSubtitle(),
          const SizedBox(
            height: 197,
          ),
          _emailButtons(),
        ],
      ),
    );
  }

  Widget _welcomeImage() {
    return Container(
      margin: const EdgeInsets.only(top: 150.0, bottom: 150.0, right: 54.0),
      height: 450,
      width: 659,
      child: Image.asset("assets/images/wel.png"),
    );
  }

  Widget _textTitleAndSubtitle() {
    return Column(
      children: const <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "StudyHub",
            style: TextStyle(
              color: selectedMenuColor,
              fontSize: 64,
              fontFamily: "ArchitectsDaughter",
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "prepare to exams together",
            style: TextStyle(
              color: selectedMenuColor,
              fontSize: 36,
              fontFamily: "ArchitectsDaughter",
            ),
          ),
        ),
      ],
    );
  }

  Widget _emailButtons() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _innopolisAccountContainer(),
          const SizedBox(
            height: 15,
          ),
          _mailAccountContainer(),
        ],
      ),
    );
  }

  Widget _innopolisAccountContainer() {
    return SizedBox(
      height: 44,
      width: 320,
      child: MaterialButton(
        onPressed: () {
          //TODO
        },
        color: selectedMenuColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: Image.asset(
                "assets/images/innopolis_logo.png",
                height: 24,
                width: 24,
              ),
            ),
            const Text(
              "Continue with IU account",
              style: TextStyle(
                color: selectedTabColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _mailAccountContainer() {
    return SizedBox(
      height: 44,
      width: 320,
      child: MaterialButton(
        onPressed: () {
          Get.offNamed(AppRoutes.login);
        },
        color: selectedTabColor,
        child: const Text(
          "Continue with email",
          style: TextStyle(
            color: selectedMenuColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
