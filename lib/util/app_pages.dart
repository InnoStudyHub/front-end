import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:study_hub/session/session.dart';
import 'package:study_hub/session/session_binding.dart';
import 'package:study_hub/util/routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.session,
      page: () => const Session(),
      binding: SessionBinding(),
    ),
  ];
}
