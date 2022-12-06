import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_hub/presentation/widgets/folder_view.dart';
import '../../../util/color_codes.dart';
import 'for_you_controller.dart';

class ForYouPage extends StatelessWidget {
  const ForYouPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<ForYouController>(() => ForYouController());

    return GetBuilder<ForYouController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: controller.folders.isEmpty
              ? Center(
                  child: controller.isLoading
                      ? AlertDialog(
                          backgroundColor: mainAppColor,
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              CircularProgressIndicator(
                                color: selectedTabColor,
                              ),
                            ],
                          ),
                        )
                      : const Text(
                          "No decks available.",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: greySecondary,
                          ),
                        ),
                )
              : ListView(
                  physics: const BouncingScrollPhysics(),
                  children: <Widget>[
                    const SizedBox(
                      height: 17.5,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.folders.length,
                      itemBuilder: (context, index) {
                        return FolderView(folder: controller.folders[index]);
                      },
                    ),
                  ],
                ),
        ),
      );
    });
  }
}
