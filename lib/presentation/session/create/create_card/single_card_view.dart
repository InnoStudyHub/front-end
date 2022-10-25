import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../util/color_codes.dart';
import '../../../util/fullscreen_image.dart';
import 'add_cards_controller.dart';

Widget singleCardView({
  required AddCardsController controller,
  required int index,
  required BuildContext context,
}) {
  final ImagePicker picker = ImagePicker();

  Widget formFieldHeading(String heading) {
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

  Widget deleteButton() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: IconButton(
        onPressed: () {
          controller.deleteCard(index);
        },
        icon: SvgPicture.asset(
          "assets/icons/create_cards/delete_card.svg",
          width: 20,
          height: 20,
        ),
      ),
    );
  }

  Widget formField({
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

  Widget addImageButton(bool isQuestion) {
    String title = "Add image";
    if (!isQuestion && controller.cardModels[index].answerImages != null) {
      title = "Add";
    }

    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: const EdgeInsets.fromLTRB(10, 15, 10, 20),
        height: 28,
        child: MaterialButton(
          color: purpleAppColor,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          onPressed: () async {
            XFile? im = await picker.pickImage(source: ImageSource.gallery);
            if (isQuestion) {
              controller.cardModels[index].questionImage = im!.path;
            } else {
              if (controller.cardModels[index].answerImages == null) {
                controller.cardModels[index].answerImages = [im!.path];
              } else {
                controller.cardModels[index].answerImages!.add(im!.path);
              }
            }
            controller.update();
          },
        ),
      ),
    );
  }

  Widget imagePreview(String? image, bool isQuestion, int i) {
    var tag = "$index $isQuestion $i";
    return image != null
        ? Container(
            margin: const EdgeInsets.all(10),
            constraints: const BoxConstraints(
              maxHeight: 50,
              maxWidth: 300,
            ),
            child: GestureDetector(
              onTap: () {
                Get.to(FullscreenImage(
                  card: controller.cardModels[index],
                  isQuestion: isQuestion,
                  index: i,
                  update: controller.update,
                  heroTag: tag,
                ));
              },
              child: Hero(
                  tag: tag,
                  child: Image(
                    image: FileImage(File(image)),
                    fit: BoxFit.scaleDown,
                    height: 50,
                  )),
            ))
        : const Center();
  }

  Widget imagePreviewList() {
    return controller.cardModels[index].answerImages == null
        ? Container()
        : SizedBox(
            height: 70,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.cardModels[index].answerImages!.length,
              itemBuilder: (context, i) {
                return imagePreview(
                    controller.cardModels[index].answerImages![i], false, i);
              },
            ),
          );
  }

  return Container(
    margin: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: mainAppColor,
      borderRadius: BorderRadius.circular(4),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            formFieldHeading("Question"),
            deleteButton(),
          ],
        ),
        formField(
          controller: controller.cardModels[index].questionController,
          asset: "assets/icons/create_cards/create_card_question_mark.svg",
          label: "Question",
          error: controller.cardModels[index].questionError,
        ),
        Row(
          children: [
            controller.cardModels[index].questionImage == null
                ? addImageButton(true)
                : const Center(),
            imagePreview(controller.cardModels[index].questionImage, true, 0),
          ],
        ),
        formFieldHeading("Answer"),
        formField(
          controller: controller.cardModels[index].answerController,
          asset: "assets/icons/create_cards/create_card_answer_tick.svg",
          label: "Answer",
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: [
              imagePreviewList(),
              addImageButton(false),
            ],
          ),
        ),
      ],
    ),
  );
}
