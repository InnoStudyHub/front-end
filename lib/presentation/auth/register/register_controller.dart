import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../model/models/resource.dart';
import '../../../model/repository/auth_repository.dart';

class RegisterController extends GetxController {
  AuthRepository authRepo = Get.find();

  RegisterController() {
    emailController.addListener(() {
      _email = emailController.text.toString();
      debugPrint(_email);
    });

    passwordController.addListener(() {
      _password = passwordController.text.toString();
      debugPrint(_password);
    });

    fullNameController.addListener(() {
      _fullName = fullNameController.text.toString();
      debugPrint(_fullName);
    });
  }

  var isPasswordVisible = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String _email = "";
  String _password = "";
  String _fullName = "";

  void changePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  Future<void> register() async {
    var response = await authRepo.register(
        email: _email, password: _password, fullName: _fullName);

    if (response is Success) {
      Get.back();
    }
  }
}
