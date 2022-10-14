import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../util/color_codes.dart';

class OutlinedTextField extends StatelessWidget {
  final String label;
  final TextEditingController? textFieldController;
  final IconData? prefixIconData;
  final String? assetName;
  final TextInputType? inputType;

  const OutlinedTextField(
      {super.key,
      required this.label,
      this.prefixIconData,
      this.assetName,
      this.textFieldController,
      this.inputType});

  @override
  Widget build(BuildContext context) {
    IconButton? prefixIcon;
    IconButton? suffixIcon;

    if (assetName != null) {
      IconButton kek = IconButton(
        icon: SvgPicture.asset(
          assetName!,
          color: greySecondary,
          fit: BoxFit.scaleDown,
        ),
        onPressed: () {},
      );
      prefixIcon = kek;
    } else {
      prefixIcon = prefixIconData != null
          ? IconButton(
              icon: Icon(prefixIconData),
              color: greySecondary,
              onPressed: () {},
            )
          : null;
    }

    return Container(
      margin: const EdgeInsets.fromLTRB(20, 15, 20, 0),
      child: TextFormField(
        controller: textFieldController,
        style: const TextStyle(color: selectedMenuColor),
        cursorColor: unselectedMenuColor,
        maxLines: 1,
        keyboardType: inputType,
        decoration: InputDecoration(
          filled: true,
          fillColor: backgroundDarkBlue,
          prefixIcon: prefixIcon,
          labelText: label,
          labelStyle: const TextStyle(
            color: unselectedMenuColor,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: unselectedMenuColor),
          ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
