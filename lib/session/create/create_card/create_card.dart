import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../util/color_codes.dart';

class ForYouPage extends StatelessWidget {
  const ForYouPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Container(
        child: ListView(
          children: <Widget>[_createCard(), _addButton(), _finishButton()],
        ),
      ),
    ),
  );

  Widget _createCard() {
    // Я старался эти виджеты в ListView впихнуть, но почему-то они не отображались. Оставил так
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: mainAppColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: const EdgeInsets.only(top: 30, left: 20),
                    child: const Text(
                      "Question",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    style: const TextStyle(color: selectedMenuColor),
                    keyboardType: TextInputType.multiline,
                    cursorColor: unselectedMenuColor,
                    maxLines: null,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filled: true,
                      prefixIcon: SvgPicture.asset(
                          "assets/create_card_question_mark.svg",
                          color: unselectedMenuColor),
                      labelText: "Question",
                      labelStyle: TextStyle(
                        color: unselectedTabColor,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: unselectedTabColor),
                      ),
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin:
                      const EdgeInsets.only(top: 15, left: 20, bottom: 20),
                      height: 44,
                      child: MaterialButton(
                        onPressed: () {},
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        color: purpleAppColor,
                        child: const Text(
                          "Add Image",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    )),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: const EdgeInsets.only(top: 30, left: 20),
                    child: const Text(
                      "Answer",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    style: const TextStyle(color: selectedMenuColor),
                    cursorColor: unselectedMenuColor,
                    maxLines: 1,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filled: true,
                      prefixIcon: SvgPicture.asset(
                          "assets/create_card_answer_tick.svg",
                          color: unselectedMenuColor),
                      labelText: "Answer",
                      labelStyle: TextStyle(
                        color: unselectedTabColor,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: unselectedTabColor),
                      ),
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin:
                      const EdgeInsets.only(top: 15, left: 20, bottom: 20),
                      height: 44,
                      child: MaterialButton(
                        onPressed: () {},
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        color: purpleAppColor,
                        child: const Text(
                          "Add Image",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _addButton() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 30, 20, 0),
      height: 60,
      child: MaterialButton(
          onPressed: () {},
          color: mainAppColor,
          child: Icon(
            Icons.add,
            color: selectedMenuColor,
          )),
    );
  }

  Widget _finishButton() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 30, 20, 0),
      height: 60,
      child: MaterialButton(
        onPressed: () {},
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