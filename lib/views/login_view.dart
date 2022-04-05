import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owlnews/constant/utils.dart';
import 'package:owlnews/controllers/login_controller.dart';
import 'package:owlnews/views/singup_view.dart';
import 'package:owlnews/widgets/button_widgets.dart';
import 'package:owlnews/widgets/button_widgetsicon.dart';
import 'package:owlnews/widgets/textfield_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(17),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Image.asset('assets/images/logo_owlexa.png'),
                ),
                const Text(
                  'Sign In',
                  style: popinsHeader,
                ),
                Text(
                  'Please login first before using the Owlexa Application',
                  style: poppinsLight.copyWith(color: Colors.grey),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                  isPass: false,
                  hintext: 'Email',
                  style: poppinsLight.copyWith(color: Colors.grey[500]),
                  textInputType: TextInputType.emailAddress,
                  controller: controller.emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter your name!";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    controller.emailController.text = value!;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                  isPass: true,
                  hintext: 'Password',
                  style: poppinsLight.copyWith(color: Colors.grey[500]),
                  textInputType: TextInputType.emailAddress,
                  controller: controller.passController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter your Password!";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    controller.passController.text = value!;
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    child: Text(
                      'Forgot Password?',
                      style: poppinsbold12.copyWith(
                        color: const Color(0xff00B2C7),
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      child: AnimatedContainer(
                        duration: const Duration(microseconds: 500),
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            color: controller.isView.value
                                ? const Color(0xff00B2C7)
                                : Colors.transparent,
                            border: controller.isView.value
                                ? Border.all(color: Colors.transparent)
                                : Border.all(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Remember Me',
                      style: poppinsLight.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                  color: const Color(0xff00B2C7),
                  onPressed: () async {
                    if (controller.formKey.currentState!.validate()) {
                      controller.loginStorage();
                    }
                  },
                  text: 'Login',
                  style: poppinsbold.copyWith(color: Colors.white),
                ),
                ButtonWidget2(
                  image: 'assets/images/logo_google.png',
                  onPressed: () {},
                  text: 'Sign in with Google',
                  style: poppinsbold.copyWith(color: Colors.grey),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don’t have an account yet ? ',
                      style: poppinsLight,
                    ),
                    InkWell(
                      child: Text(
                        'Sign Up',
                        style: poppinsbold12.copyWith(
                          color: const Color(0xff00B2C7),
                        ),
                      ),
                      onTap: () {
                        Get.to(() => SignupScreen());
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
