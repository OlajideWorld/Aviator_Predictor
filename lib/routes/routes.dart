import 'package:aviatorpredict/login%20screen/screens/loginInScreen.dart';
import 'package:get/get.dart';

import '../homePage/screens/homescreen.dart';
import '../homePage/screens/splashScree.dart';

class myRoutes {
  static const splashScreen = "/splashScreen";
  static const homeScreen = "/homeScreen";
  static const signinScreen = "/signinScreen";
  static const loginScreen = "/loginscreen";
}

class Pages {
  static const login = myRoutes.loginScreen;
  static final routes = [
    GetPage(name: myRoutes.splashScreen, page: () => const SplashScreen()),
    GetPage(name: myRoutes.loginScreen, page: () => const LoginScreen()),
    GetPage(name: myRoutes.homeScreen, page: () => HomeScreen()),
  ];
}
