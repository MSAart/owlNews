import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owlnews/helper/injector.dart';
import 'package:owlnews/views/login_view.dart';
import 'package:owlnews/views/singup_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      title: 'OwlNews',
      initialBinding: Injector(),
      home: LoginScreen(),
    );
  }
}
