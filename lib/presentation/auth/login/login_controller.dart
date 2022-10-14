import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:study_hub/model/models/resource.dart';
import '../../../model/repository/auth_repository.dart';
import '../../util/routes.dart';

class LoginController extends GetxController {
  AuthRepository authRepo = Get.find();

  LoginController() {
    emailController.addListener(() {
      _email = emailController.text.toString();
      debugPrint(_email);
    });

    passwordController.addListener(() {
      _password = passwordController.text.toString();
      debugPrint(_password);
    });
  }

  var isPasswordVisible = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String _email = "";
  String _password = "";

  void changePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  Future<void> login() async {
    var response = await authRepo.login(email: _email, password: _password);
    if (response is Success) {
      Get.offNamed(AppRoutes.session);
    }
  }
}
