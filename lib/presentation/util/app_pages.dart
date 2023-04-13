import 'package:get/get_navigation/src/routes/get_route.dart';
import '../session/session.dart';
import '../session/session_binding.dart';
import 'routes.dart';
import '../auth/login/login_page.dart';
import '../auth/login/login_page_binding.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.session,
      page: () => const Session(),
      binding: SessionBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
  ];
}
