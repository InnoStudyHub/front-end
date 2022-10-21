import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../util/color_codes.dart';

Widget singleCardView({
  required TextEditingController questionController,
  required TextEditingController answerController,
  required String? questionError,
}) {
  return Container(
    margin: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: mainAppColor,
      borderRadius: BorderRadius.circular(4),
    ),
    child: Column(
      children: <Widget>[
        _formFieldHeading("Question"),
        _formField(
          controller: questionController,
          asset: "assets/icons/create_cards/create_card_question_mark.svg",
          label: "Question",
          error: questionError,
        ),
        _addImageButton(() {}),
        _formFieldHeading("Answer"),
        _formField(
          controller: answerController,
          asset: "assets/icons/create_cards/create_card_answer_tick.svg",
          label: "Answer",
        ),
        _addImageButton(() {}),
      ],
    ),
  );
}

Widget _formFieldHeading(String heading) {
  return Align(
    alignment: Alignment.topLeft,
    child: Container(
      margin: const EdgeInsets.only(top: 15, left: 20),
      child: Text(
        heading,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}

Widget _formField({
  required TextEditingController controller,
  String? error,
  required String asset,
  required String label,
}) {
  return Container(
    margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
    child: TextFormField(
      style: const TextStyle(color: selectedMenuColor),
      keyboardType: TextInputType.multiline,
      cursorColor: unselectedMenuColor,
      controller: controller,
      maxLines: null,
      decoration: InputDecoration(
        errorText: error,
        prefixIcon: SvgPicture.asset(
          asset,
          color: unselectedMenuColor,
          fit: BoxFit.scaleDown,
        ),
        labelText: label,
        labelStyle: const TextStyle(color: unselectedTabColor),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: unselectedTabColor),
        ),
      ),
    ),
  );
}

Widget _addImageButton(VoidCallback callback) {
  return Align(
    alignment: Alignment.topLeft,
    child: Container(
      margin: const EdgeInsets.only(top: 15, left: 10, bottom: 20),
      height: 28,
      width: 150,
      child: MaterialButton(
        onPressed: () {
          callback();
        },
        //padding: const EdgeInsets.symmetric(horizontal: 50),
        color: purpleAppColor,
        child: const Text(
          "Add Image",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Roboto",
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
    ),
  );
}
