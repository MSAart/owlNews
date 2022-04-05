import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:owlnews/views/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  RxBool isView = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> loginStorage() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    if (localStorage.get('email') == emailController.value.text) {
      if (localStorage.get('pass') == passController.value.text) {
        Get.defaultDialog(
          title: 'Login Successfull!',
          onConfirm: () {
            Get.off(() => HomePage());
          },
        );
      } else {
        Get.defaultDialog(title: 'wrong Password!');
        passController.clear();
      }
    } else {
      Get.defaultDialog(title: 'Email not Register!');
      emailController.clear();
    }
  }

  @override
  void onReady() {
    // loginStorage();
    // TODO: implement onReady
    super.onReady();
  }
}
