import 'package:get/get.dart';
import '../../../domain/use_case/deck/get_author_name_use_case.dart';

class DeckViewController extends GetxController {
  var courseName = "Course Name not specified";
  var authorName = "Author name not specified";

  DeckViewController(int course, int author) {
    getAuthorName(author);
  }

  Future<void> getAuthorName(int author) async {
    authorName = await GetAuthorNameUseCase.invoke(author);
    update();
  }
}
