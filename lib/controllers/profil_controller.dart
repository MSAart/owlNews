import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilController extends GetxController {
  late String name;
  late String email;

  Future<void> fetchLogin() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    name = localStorage.get('name').toString();
    email = localStorage.get('email').toString();
  }

  @override
  void onInit() {
    fetchLogin();
    // TODO: implement onInit
    super.onInit();
  }
}
