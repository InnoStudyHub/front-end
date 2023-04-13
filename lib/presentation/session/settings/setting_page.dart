import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../util/color_codes.dart';
import '../../widgets/themed_material_button.dart';
import 'settings_controller.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(builder: (controller) {
      return Scaffold(
        body: Center(
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ThemedMaterialButton(
                  text: "Logout",
                  callback: () {
                    controller.logout();
                  },
                  color: selectedTabColor,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
