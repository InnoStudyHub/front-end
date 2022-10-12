import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
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
}
