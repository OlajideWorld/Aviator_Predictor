import 'package:aviatorpredict/homePage/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  
  @override
  void onReady() async {
    // TODO: implement onReady
    super.onReady();
    await Future.delayed(const Duration(seconds: 6), () {
      Get.to(() => HomeScreen());
    });
  }
}
