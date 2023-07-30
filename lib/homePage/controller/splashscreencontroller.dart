import 'package:aviatorpredict/homePage/screens/BetsDisplayScreen.dart';
import 'package:aviatorpredict/login%20screen/screens/loadingscreen.dart';
import 'package:aviatorpredict/utils/getxmessage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../login screen/screens/loginInScreen.dart';

class SplashController extends GetxController {
  static SplashController instance = Get.find();

  @override
  void onReady() async {
    // TODO: implement onReady
    super.onReady();
    await Future.delayed(const Duration(seconds: 6), () {
      Get.to(() => const LoginScreen());
    });
  }

  Future<void> signin(String email, String password) async {
    Get.to(() => LoadingScreen());
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      getSuccessSnackBar("Sign in Successsful");
      Get.to(() => BetDisplayScreen());
    } catch (e) {
      getErrorSnackBar("Sign in Error, $e");
      Get.back();
      debugPrint("Error in Sign in $e");
    }
  }

  Future<void> registerUser(
      String email, String username, String password) async {
    Get.to(() => LoadingScreen());
    try {
      // Register the user with Firebase Authentication
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Get the UID (user ID) of the newly created user
      String userId = userCredential.user!.uid;

      // Store additional user information (username) in Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .set({'username': username, 'email': email, 'password': password});

      // Registration successful, navigate to the home screen or display a success message
      // (You can decide what to do here based on your app's flow)
      getSuccessSnackBar("Regiistration Successful");
      Get.to(() => BetDisplayScreen());
    } catch (e) {
      // Handle registration errors (e.g., email already in use, weak password, etc.)
      // Display an error message to the user or handle it appropriately
      getErrorSnackBar("Error during registration: $e");
      Get.back();
      debugPrint('Error during registration: $e');
    }
  }
}
