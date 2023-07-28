// ignore_for_file: must_be_immutable

import 'dart:ffi';
import 'dart:math';

import 'package:aviatorpredict/utils/sizes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color redColor = const Color(0xFFE40639);

  var doubleNumber = "";
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    randomDouble();
  }

  randomDouble() {
    var doubleValue = Random().nextDouble() * 50;
    var newnumber = doubleValue.toStringAsFixed(2);
    setState(() {
      doubleNumber = newnumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              right: widthSize(10), left: widthSize(10), top: height * 0.3),
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: heightSize(150),
                  width: widthSize(150),
                  child: Image.asset(
                    "assets/aviator2.png",
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: heightSize(40)),
                Text(
                  "${doubleNumber}x",
                  style: TextStyle(
                      fontSize: fontSize(25),
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: heightSize(40)),
                GestureDetector(
                  onTap: () async {
                    setState(() {
                      isLoading = true;
                    });
                    await Future.delayed(const Duration(seconds: 2), () {
                      randomDouble();
                      setState(() {
                        isLoading = false;
                      });
                    });
                  },
                  child: Container(
                    height: heightSize(52),
                    width: widthSize(293),
                    padding: EdgeInsets.symmetric(vertical: heightSize(10)),
                    decoration: BoxDecoration(
                        color: redColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: Center(
                        child: isLoading == true
                            ? CircularProgressIndicator(
                                color: Colors.black,
                                strokeWidth: widthSize(2),
                              )
                            : Text(
                                "Get Predictions",
                                style: TextStyle(
                                    fontSize: fontSize(18),
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              )),
                  ),
                ),
                SizedBox(height: heightSize(30)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: widthSize(20)),
                  child: Row(
                    children: [
                      Text(
                        "Join our Telegram: ",
                        style: TextStyle(
                            fontSize: fontSize(12),
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      ),
                      SizedBox(width: widthSize(5)),
                      Text(
                        "https://www.heml.bg/upload/23749jnxyd890ojn",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: fontSize(12),
                            fontWeight: FontWeight.w300,
                            color: redColor),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
