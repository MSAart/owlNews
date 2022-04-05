import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owlnews/constant/utils.dart';
import 'package:owlnews/controllers/signup_controller.dart';
import 'package:owlnews/views/home_page.dart';
import 'package:owlnews/widgets/button_widgets.dart';
import 'package:owlnews/widgets/button_widgetsicon.dart';
import 'package:owlnews/widgets/textfield_widget.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignUpController>();
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
                alignment: Alignment.topLeft,
                child: InkWell(
                  child: Image.asset(
                    'assets/images/icons_back.png',
                    height: 30,
                    width: 30,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Sign Up',
                style: popinsHeader.copyWith(color: Colors.black),
              ),
              Text(
                'Create an account to login this app with your email.',
                style: poppinsLight.copyWith(color: Colors.grey),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                isPass: false,
                hintext: 'Full Name',
                style: poppinsLight.copyWith(color: Colors.grey[500]),
                textInputType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter your name";
                  }
                  return null;
                },
                onSaved: (String? value) {
                  controller.name = value!;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                isPass: false,
                hintext: 'Email',
                style: poppinsLight.copyWith(color: Colors.grey[500]),
                textInputType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter your Email";
                  }
                  return null;
                },
                onSaved: (String? value) {
                  controller.email = value!;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                isPass: true,
                hintext: 'Password',
                style: poppinsLight.copyWith(color: Colors.grey[500]),
                textInputType: TextInputType.visiblePassword,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "Please Enter your Password";
                  }
                  return null;
                },
                onSaved: (String? value) {
                  controller.pass = value!;
                },
              ),
              const SizedBox(
                height: 5,
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 15,
              ),
              ButtonWidget(
                color: const Color(0xff00B2C7),
                onPressed: () async {
                  if (controller.formKey.currentState!.validate()) {
                    controller.saveToPref();
                  }
                },
                text: 'Create Account',
                style: poppinsbold.copyWith(color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Or sign up with Google',
                  style: poppinsLight,
                ),
              ),
              ButtonWidget2(
                image: 'assets/images/logo_google.png',
                onPressed: () {},
                text: 'Sign up with Google',
                style: poppinsbold.copyWith(color: Colors.grey),
              ),
              const SizedBox(
                height: 20,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account ? ',
                    style: poppinsLight,
                  ),
                  InkWell(
                    child: Text(
                      'Sign In',
                      style: poppinsbold12.copyWith(
                        color: const Color(0xff00B2C7),
                      ),
                    ),
                    onTap: () {
                      Get.back();
                    },
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
