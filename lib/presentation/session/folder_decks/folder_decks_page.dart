import "package:flutter/material.dart";
import 'package:get/get.dart';
import '../../../model/models/folder.dart';
import '../../util/color_codes.dart';
import '../deck_preview/deck_preview.dart';
import 'folder_decks_controller.dart';

class FolderDecksPage extends StatelessWidget {
  final Folder folder;

  const FolderDecksPage({
    required this.folder,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<FolderDecksController>(() => FolderDecksController(folder.id));

    return GetBuilder<FolderDecksController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(title: Text(folder.name)),
        body: SafeArea(
          child: controller.isEmpty
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
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.decks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return DeckPreview(
                      deck: controller.decks[index],
                    );
                  },
                ),
        ),
      );
    });
  }
}
