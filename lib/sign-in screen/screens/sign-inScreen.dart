import 'package:aviatorpredict/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

final _formKey = GlobalKey<FormState>();
final _emailController = TextEditingController();
final _passwordController = TextEditingController();
final _usernameController = TextEditingController();

Color redColor = const Color(0xFFE40639);

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Container(
          height: height,
          width: width,
          padding: EdgeInsets.only(
              top: height * 0.18, left: widthSize(20), right: widthSize(20)),
          child: Column(children: [
            Text(
              "Create new Account",
              style: TextStyle(
                color: Colors.white,
                fontSize: fontSize(45),
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: heightSize(20)),
            GestureDetector(
              onTap: () => Get.back(),
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already Registered? ",
                      style: TextStyle(
                          fontSize: fontSize(18),
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    ),
                    SizedBox(width: widthSize(5)),
                    Text(
                      "Login Here",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: fontSize(18),
                          fontWeight: FontWeight.w800,
                          color: redColor),
                    )
                  ],
                ),
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
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                    hintText: 'Enter UserName'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your username';
                  }
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
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                    hintText: 'Enter Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your username';
                  }
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
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock_clock_outlined,
                      color: Colors.white.withOpacity(0.7),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade700)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade700)),
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                    hintText: 'Enter Password'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your username';
                  }
                  // You can add more username validation if needed
                  return null;
                },
              ),
            ),
            SizedBox(height: heightSize(50)),
            Container(
              height: heightSize(55),
              width: width,
              decoration: BoxDecoration(
                  color: redColor,
                  borderRadius: const BorderRadius.all(Radius.circular(3))),
              child: Center(
                  child: Text(
                "Sign Up",
                style: TextStyle(
                    fontSize: fontSize(20),
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              )),
            ),
          ]),
        )));
  }
}
