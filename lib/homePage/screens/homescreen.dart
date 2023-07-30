// ignore_for_file: must_be_immutable

import 'dart:math';
import 'dart:async';

import 'package:aviatorpredict/utils/sizes.dart';
import 'package:flutter/material.dart';

import '../controller/timercontroller.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color redColor = const Color(0xFFE40639);
  late MyTimer myTimer;
  double _counter = 1.98;

  @override
  void initState() {
    super.initState();
    // myTimer = MyTimer(onUpdateCounter); // Initialize myTimer here

    // myTimer.startTimer();
  }

  @override
  void dispose() {
    myTimer.stopTimer();
    super.dispose();
  }

  void onUpdateCounter(double counter) {
    setState(() {
      _counter = double.parse(counter.toStringAsFixed(2));
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
              right: widthSize(20), left: widthSize(20), top: height * 0.2),
          child: Align(
            alignment: Alignment.center,
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
                    "${_counter}x",
                    style: TextStyle(
                        fontSize: fontSize(100),
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: heightSize(40)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
