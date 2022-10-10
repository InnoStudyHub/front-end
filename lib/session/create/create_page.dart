import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../util/color_codes.dart';
import 'create_controller.dart';

class CreatePage extends GetView<CreateController> {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            _courseNameField(),
            _deckNameField(),
            _materialsYearField(),
            _createCardsButton(),
            _divider(),
            _uploadFromGoogleSheetButton(),
          ],
        ),
      ),
    );
  }

  Widget _courseNameField() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 50, 20, 0),
      child: TextFormField(
        style: const TextStyle(color: selectedMenuColor),
        cursorColor: unselectedMenuColor,
        maxLines: 1,
        decoration: InputDecoration(
          filled: true,
          fillColor: backgroundDarkBlue,
          prefixIcon: SvgPicture.asset(
            "assets/icons/create_page/course_name.svg",
            color: greySecondary,
          ),
          labelText: "Course name",
          labelStyle: const TextStyle(
            color: unselectedMenuColor,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: unselectedMenuColor),
          ),
        ),
      ),
    );
  }

  Widget _deckNameField() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: TextFormField(
        style: const TextStyle(color: selectedMenuColor),
        cursorColor: unselectedMenuColor,
        maxLines: 1,
        decoration: InputDecoration(
          filled: true,
          fillColor: backgroundDarkBlue,
          prefixIcon: SvgPicture.asset(
            "assets/icons/create_page/deck_name.svg",
            color: greySecondary,
          ),
          labelText: "Deck name",
          labelStyle: const TextStyle(
            color: unselectedMenuColor,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: unselectedMenuColor),
          ),
        ),
      ),
    );
  }

  Widget _materialsYearField() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: TextFormField(
        style: const TextStyle(color: selectedMenuColor),
        cursorColor: unselectedMenuColor,
        maxLines: 1,
        decoration: InputDecoration(
          filled: true,
          fillColor: backgroundDarkBlue,
          prefixIcon: SvgPicture.asset(
            "assets/icons/create_page/materials_year.svg",
            color: greySecondary,
          ),
          labelText: "Materials' year",
          labelStyle: const TextStyle(
            color: unselectedMenuColor,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: unselectedMenuColor),
          ),
        ),
      ),
    );
  }

  Widget _createCardsButton() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 40, 20, 0),
      height: 44,
      child: MaterialButton(
        onPressed: () {},
        color: selectedTabColor,
        child: const Text(
          "Create cards",
          style: TextStyle(
            color: selectedMenuColor,
            fontFamily: "Roboto",
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: const EdgeInsets.only(top: 25),
      child: Row(
        children: const [
          Expanded(
            child: Divider(
              thickness: 1,
              indent: 20,
              endIndent: 10,
              color: unselectedMenuColor,
            ),
          ),
          Text(
            "or",
            style: TextStyle(
              color: unselectedMenuColor,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
          Expanded(
            child: Divider(
              thickness: 1,
              indent: 10,
              endIndent: 20,
              color: unselectedTabColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _uploadFromGoogleSheetButton() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 25, 20, 0),
      height: 44,
      child: MaterialButton(
        onPressed: () {},
        color: purpleAppColor,
        child: const Text(
          "Upload from google sheet",
          style: TextStyle(
            color: selectedMenuColor,
            fontFamily: "Roboto",
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
