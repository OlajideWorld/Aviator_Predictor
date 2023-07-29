import 'package:get/get.dart';

import '../../login screen/screens/loginInScreen.dart';

class SplashController extends GetxController {
  @override
  void onReady() async {
    // TODO: implement onReady
    super.onReady();
    await Future.delayed(const Duration(seconds: 6), () {
      Get.to(() => LoginScreen());
    });
  }
}
