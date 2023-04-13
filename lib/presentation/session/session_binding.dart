import 'package:get/get.dart';
import 'package:study_hub/presentation/session/settings/settings_controller.dart';
import 'package:study_hub/presentation/session/search/search_controller.dart';
import '../../domain/repository/remote/deck_repository_impl.dart';
import '../../model/repository/deck_repository.dart';
import 'home/home_controller.dart';
import 'session_controller.dart';

class SessionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SessionController>(() => SessionController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<SettingsController>(() => SettingsController());
    Get.lazyPut<SearchController>(() => SearchController());
    Get.put<DeckRepository>(DeckRepositoryImpl());
  }
}
