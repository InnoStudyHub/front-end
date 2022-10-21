import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/color_codes.dart';
import 'favourites_controller.dart';

class FavouritesPage extends GetView<FavouritesController> {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              _searchBar(),
              _deckPreview(),
              _deckPreview(),
              _deckPreview(),
              _deckPreview(),
              _deckPreview(),
              _deckPreview(),
            ],
          ),
        ),
      );

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        height: 48,
        child: TextField(
          onChanged: (value) => {},
          decoration: const InputDecoration(
            filled: true,
            fillColor: mainAppColor,
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(
              Icons.search,
              color: greySecondary,
            ),
            border: OutlineInputBorder(borderSide: BorderSide.none),
            hintStyle: TextStyle(fontSize: 16, color: unselectedTabColor),
            hintText: "Search for a deck or course",
          ),
          style: const TextStyle(fontSize: 18, color: greySecondary),
          cursorColor: greySecondary,
        ),
      ),
    );
  }

  Widget _deckPreview() {
    return Padding(
      padding:
          const EdgeInsets.only(top: 12.5, left: 20, right: 20, bottom: 12.5),
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
                    margin: const EdgeInsets.only(top: 10, left: 16, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          "Final exam",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: greySecondary)),
                          child: const Text(
                            "13",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(
                      top: 8, left: 16, right: 16, bottom: 9),
                  child: const Text(
                    "Mathematical Analysis I",
                    style: TextStyle(
                      color: greySecondary,
                      fontSize: 14,
                    ),
                  ),
                ),
                const Divider(
                  thickness: 1,
                  indent: 16,
                  endIndent: 16,
                  color: unselectedMenuColor,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: const EdgeInsets.only(left: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          "2022",
                          style: TextStyle(
                            color: greySecondary,
                            fontSize: 14,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.copy,
                                color: greySecondary,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.bookmark,
                                color: greySecondary,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
