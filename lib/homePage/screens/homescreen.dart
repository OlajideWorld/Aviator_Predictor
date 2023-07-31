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

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  static const Duration stopDuration1 = Duration(seconds: 4);
  static const Duration stopDuration2 = Duration(seconds: 3);

  Color redColor = const Color(0xFFE40639);
  late MyTimer myTimer;
  double _counter = 1.98;

  @override
  void initState() {
    super.initState();
    // Animation duration for one complete cycle (0.00 to 1.98 and back to 0.00)
    const animationDuration = Duration(seconds: 7); // 4s stop + 3s stop

    _controller = AnimationController(
      vsync: this,
      duration: animationDuration,
    );

    // Create a custom animation curve using TweenSequence
    _animation = TweenSequence<double>([
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0.00, end: 1.98),
        weight: 0.571, // 4 seconds (4s / 7s)
      ),
      TweenSequenceItem<double>(
        tween: ConstantTween<double>(1.98),
        weight: 0.286, // 2 seconds (2s / 7s)
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 1.98, end: 0.00),
        weight: 0.143, // 1 second (1s / 7s)
      ),
    ]).animate(_controller);

    // Listen to animation status and restart the animation when it completes.
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Wait for 3 seconds before reversing the animation
        Future.delayed(stopDuration2, () {
          _controller.reverse();
        });
      } else if (status == AnimationStatus.dismissed) {
        // Wait for 4 seconds before forwarding the animation
        Future.delayed(stopDuration1, () {
          _controller.forward();
        });
      }
    });

    // Start the animation
    _controller.forward();
  }

  // myTimer = MyTimer(onUpdateCounter); // Initialize myTimer here

  // myTimer.startTimer();

  @override
  void dispose() {
    _controller.dispose();
    // myTimer.stopTimer();
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
                  SizedBox(height: heightSize(60)),
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Text(
                        "${_animation.value.toStringAsFixed(2)}x", // Display value with 2 decimal places
                        style:
                            const TextStyle(fontSize: 60, color: Colors.white),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
