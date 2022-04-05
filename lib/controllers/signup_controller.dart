import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owlnews/views/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpController extends GetxController {
  String name = '';
  String email = '';
  String pass = '';
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> saveToPref() async {
    if (formKey.currentState != null || formKey.currentState!.validate()) {
      formKey.currentState!.save();
      SharedPreferences localStorage = await SharedPreferences.getInstance();

      localStorage.setString('name', name);
      localStorage.setString('email', email);
      localStorage.setString('pass', pass);

      Get.defaultDialog(
          title: 'Account Has Been Register',
          onConfirm: () {
            Get.off(() => HomePage());
          });
    } else {
      Get.defaultDialog(title: 'Registration Account Failed', textCancel: 'OK');
    }
  }
}
