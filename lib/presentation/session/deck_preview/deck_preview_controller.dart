import 'package:get/get.dart';
import 'package:study_hub/model/models/deck.dart';
import '../../../domain/use_case/deck/add_to_favourites_use_case.dart';
import '../../../domain/use_case/deck/get_course_name_use_case.dart';
import '../../../domain/use_case/deck/remove_from_favourites_use_case.dart';

class DeckPreviewController extends GetxController {
  var courseName = "Course Name not specified";

  Future<void> getCourseName(int course) async {
    courseName = await GetCourseNameUseCase.invoke(course);
    update();
  }

  void addDeckToFavourites(Deck deck) {
    deck.isFavourite = true;
    AddToFavouritesUseCase.invoke(deck);
    update();
  }

  void removeDeckFromFavourites(Deck deck) {
    deck.isFavourite = false;
    RemoveFromFavouritesUseCase.invoke(deck);
    update();
  }
}
