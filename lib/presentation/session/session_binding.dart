import 'package:get/get.dart';
import 'favourites/favourites_controller.dart';
import 'home/home_controller.dart';
import 'profile/profile_controller.dart';
import 'create/create_deck_controller.dart';
import 'session_controller.dart';

class SessionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SessionController>(() => SessionController(), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<ProfileController>(() => ProfileController(), fenix: true);
    Get.lazyPut<CreateDeckController>(() => CreateDeckController(), fenix: true);
    Get.lazyPut<FavouritesController>(() => FavouritesController(), fenix: true);
  }
}
