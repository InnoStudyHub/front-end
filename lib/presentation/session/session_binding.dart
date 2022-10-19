import 'package:get/get.dart';
import 'package:study_hub/presentation/session/create/create_deck_controller.dart';
import 'session_controller.dart';

class SessionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SessionController>(() => SessionController());
    Get.lazyPut<CreateDeckController>(() => CreateDeckController());
  }
}
