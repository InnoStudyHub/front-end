import 'package:flutter/material.dart';
import '../../../util/color_codes.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              _searchBar(),
            ],
          ),
        ),
      );

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        height: 50,
        child: TextField(
          onChanged: (value) => null,
          decoration: const InputDecoration(
              filled: true,
              fillColor: mainAppColor,
              contentPadding: EdgeInsets.all(0),
              prefixIcon: Icon(
                Icons.search,
                color: greySecondary,
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none
              ),
              hintStyle: TextStyle(fontSize: 18, color: unselectedTabColor),
              hintText: "Search for a deck or course",
              suffixIcon: Icon(
                Icons.filter_alt_outlined,
                color: greySecondary
              )
          ),
          style: TextStyle(fontSize: 18, color: greySecondary),
          cursorColor: greySecondary,
        ),
      ),
    );
  }

}
