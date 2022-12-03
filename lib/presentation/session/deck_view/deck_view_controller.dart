import 'package:get/get.dart';
import '../../../domain/use_case/deck/get_course_name_use_case.dart';

class DeckViewController extends GetxController {
  var courseName = "Course Name not specified";

  Future<void> getCourseName(int course) async {
    courseName = await GetCourseNameUseCase.invoke(course);
    update();
  }
}
