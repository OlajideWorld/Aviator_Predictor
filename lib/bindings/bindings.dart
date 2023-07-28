import 'package:aviatorpredict/homePage/controller/splashscreencontroller.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<SplashController>(SplashController());
  }
}
