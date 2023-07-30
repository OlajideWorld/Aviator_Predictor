import 'package:aviatorpredict/homePage/controller/splashscreencontroller.dart';
import 'package:aviatorpredict/utils/getxmessage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../sign-in screen/screens/sign-inScreen.dart';
import '../../utils/sizes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Color redColor = const Color(0xFFE40639);

  final SplashController controller = SplashController.instance;

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Container(
            height: height,
            width: width,
            padding: EdgeInsets.only(
                top: height * 0.28, left: widthSize(20), right: widthSize(20)),
            decoration: const BoxDecoration(color: Colors.black),
            child: Column(children: [
              SizedBox(
                height: heightSize(150),
                width: widthSize(150),
                child: Image.asset(
                  "assets/aviator2.png",
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: heightSize(30)),
              Container(
                height: heightSize(60),
                decoration: BoxDecoration(
                    color: Colors.grey.shade700,
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: TextFormField(
                  cursorColor: Colors.white,
                  controller: _emailController,
                  style: TextStyle(color: Colors.white.withOpacity(0.7)),
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person_2_outlined,
                        color: Colors.white.withOpacity(0.7),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade700)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade700)),
                      hintStyle:
                          TextStyle(color: Colors.white.withOpacity(0.7)),
                      hintText: 'Enter Email'),
                  validator: (value) {
                    if (value!.isEmpty) {}

                    // You can add more username validation if needed
                    return null;
                  },
                ),
              ),
              SizedBox(height: heightSize(30)),
              Container(
                height: heightSize(60),
                decoration: BoxDecoration(
                    color: Colors.grey.shade700,
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: TextFormField(
                  style: TextStyle(color: Colors.white.withOpacity(0.7)),
                  cursorColor: Colors.white,
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock_clock_outlined,
                        color: Colors.white.withOpacity(0.7),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade700)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade700)),
                      hintStyle:
                          TextStyle(color: Colors.white.withOpacity(0.7)),
                      hintText: 'Enter Password'),
                  validator: (value) {
                    // You can add more username validation if needed
                    return null;
                  },
                ),
              ),
              SizedBox(height: heightSize(25)),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forget Password?",
                  style: TextStyle(
                      fontSize: fontSize(18),
                      color: Colors.white.withOpacity(0.7)),
                ),
              ),
              SizedBox(height: heightSize(25)),
              GestureDetector(
                onTap: () {
                  final value = _formKey.currentState!.validate();
                  if (!value) {
                    getErrorSnackBar("Please enter your Credentials");
                  } else {
                    controller.signin(_emailController.text.trim(),
                        _passwordController.text.trim());
                  }
                },
                child: Container(
                  height: heightSize(55),
                  width: width,
                  decoration: BoxDecoration(
                      color: redColor,
                      borderRadius: const BorderRadius.all(Radius.circular(3))),
                  child: Center(
                      child: Text(
                    "Sign In",
                    style: TextStyle(
                        fontSize: fontSize(20),
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
              SizedBox(height: heightSize(25)),
              GestureDetector(
                onTap: () => Get.to(() => const SignInScreen()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(
                          fontSize: fontSize(18),
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    ),
                    SizedBox(width: widthSize(5)),
                    Text(
                      "Sign Up",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: fontSize(18),
                          fontWeight: FontWeight.w800,
                          color: redColor),
                    )
                  ],
                ),
              ),
              SizedBox(height: heightSize(70)),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Join our Telegram: ",
                      style: TextStyle(
                          fontSize: fontSize(14),
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                    SizedBox(width: widthSize(5)),
                    Text(
                      "https://www.heml.bg/upload/23749jnxyd890ojn",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: fontSize(14),
                          fontWeight: FontWeight.w300,
                          color: redColor),
                    )
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
