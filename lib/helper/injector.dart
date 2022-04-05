import 'package:get/get.dart';
import 'package:owlnews/controllers/home_controller.dart';
import 'package:owlnews/controllers/login_controller.dart';
import 'package:owlnews/controllers/profil_controller.dart';
import 'package:owlnews/controllers/signup_controller.dart';
import 'package:owlnews/views/home_page.dart';
import 'package:owlnews/views/view_page.dart';

class Injector extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => SignUpController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ProfilController());
  }
}
