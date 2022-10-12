import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../util/color_codes.dart';

class OutlinedTextField extends StatelessWidget {
  final String label;
  final TextEditingController? textFieldController;
  final IconData? prefixIconData;
  final String? assetName;

  const OutlinedTextField(
      {super.key,
      required this.label,
      this.prefixIconData,
      this.assetName,
      this.textFieldController});

  @override
  Widget build(BuildContext context) {
    Icon? prefixIcon;
    IconButton? suffixIcon;

    if (assetName != null) {
      prefixIcon = SvgPicture.asset(
        assetName!,
        color: greySecondary,
        fit: BoxFit.scaleDown,
      ) as Icon?;
    } else {
      prefixIcon = prefixIconData != null
          ? Icon(prefixIconData, color: greySecondary)
          : null;
    }

    return Container(
      margin: const EdgeInsets.fromLTRB(20, 70, 20, 0),
      child: TextFormField(
        controller: textFieldController,
        style: const TextStyle(color: selectedMenuColor),
        cursorColor: unselectedMenuColor,
        maxLines: 1,
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
