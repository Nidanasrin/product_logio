import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();

  void login() {
    if (formkey.currentState!.validate()) {
      final username = usernamecontroller.text.trim();
      final password = passwordcontroller.text;
      final isValidUsername = username.contains('@') && username.contains('.com');
      final isValidPassword = password.length >= 6;

      if (isValidUsername && isValidPassword) {
        Get.toNamed('/home');
      } else {
        Get.snackbar("Login Failed", "Invalid Username or Password",
            snackPosition: SnackPosition.TOP,
            backgroundColor: CupertinoColors.systemGrey,
            colorText: Colors.white);
      }
    }
    }
}
