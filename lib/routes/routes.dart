import 'package:get/get.dart';

import '../homePage/screens/homescreen.dart';
import '../homePage/screens/splashScree.dart';

class myRoutes {
  static const splashScreen = "/splashScreen";
  static const homeScreen = "/homeScreen";
  static const signinScreen = "/signinScreen";
}

class Pages {
  static const splashScreen = myRoutes.splashScreen;
  static final routes = [
    GetPage(name: myRoutes.splashScreen, page: () => const SplashScreen()),
    GetPage(name: myRoutes.homeScreen, page: () => HomeScreen()),
  ];
}
