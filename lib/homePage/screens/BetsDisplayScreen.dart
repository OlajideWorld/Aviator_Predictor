import 'package:aviatorpredict/homePage/screens/homescreen.dart';
import 'package:aviatorpredict/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BetDisplayScreen extends StatelessWidget {
  BetDisplayScreen({super.key});

  List<String> imagesList = [
    "assets/aviator2.png",
    "assets/download.png",
    "assets/aviator2.png",
    "assets/aviator2.png",
    "assets/aviator2.png",
    "assets/aviator2.png",
    "assets/aviator2.png",
    "assets/aviator2.png",
    "assets/aviator2.png",
    "assets/aviator2.png"
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(top: heightSize(20)),
        child: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(color: Colors.black),
          padding: EdgeInsets.symmetric(
              vertical: heightSize(20), horizontal: widthSize(20)),
          child: GridView.builder(
              itemCount: imagesList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 20),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Get.to(() => HomeScreen()),
                  child: Container(
                    decoration: BoxDecoration(
                      // border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      image: DecorationImage(
                          image: AssetImage(imagesList[index]),
                          fit: BoxFit.fill),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
