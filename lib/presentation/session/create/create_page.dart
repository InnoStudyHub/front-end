import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_hub/presentation/widgets/themed_material_button.dart';
import '../../widgets/divider.dart';
import '../../widgets/outlined_text_field.dart';
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
            const SizedBox(
              height: 22,
            ),
            const OutlinedTextField(
              label: "Course name",
              assetName: "assets/icons/create_page/course_name.svg",
            ),
            const OutlinedTextField(
              label: "Deck name",
              assetName: "assets/icons/create_page/deck_name.svg",
            ),
            const OutlinedTextField(
              label: "Semester. ex: Sum21, F21, S21",
              assetName: "assets/icons/create_page/materials_year.svg",
            ),
            ThemedMaterialButton(
              text: "Create Cards",
              callback: () {},
              color: selectedTabColor,
            ),
            const ThemedDivider(),
            ThemedMaterialButton(
              text: "Upload from google sheet",
              callback: () {},
              color: purpleAppColor,
            ),
          ],
        ),
      ),
    );
  }
}
