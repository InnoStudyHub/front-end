import 'package:get/get_navigation/src/routes/get_route.dart';
import '../session/session.dart';
import '../session/session_binding.dart';
import '../util/routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.session,
      page: () => const Session(),
      binding: SessionBinding(),
    ),
  ];
}
