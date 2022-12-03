import 'package:get/get.dart';

import '../../model/repository/cached_repository.dart';
import '../../model/repository/deck_repository.dart';

class SessionController extends GetxController {
  var tabIndex = 0;

  var pages = ["Home", "Create", "Profile"];

  var tabTitle = "Home";

  void changePage(int index) {
    tabTitle = pages[index];
    tabIndex = index;
    update();
  }

  @override
  void dispose() {
    super.dispose();
    Get.delete<SessionController>();
    Get.delete<DeckRepository>();
    Get.delete<CachedRepository>();
  }
}
