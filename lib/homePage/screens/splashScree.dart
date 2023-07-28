import 'package:aviatorpredict/utils/sizes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: heightSize(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                height: heightSize(500),
                child: Lottie.asset("assets/animation1.json"),
              ),
            ),
            SizedBox(height: heightSize(40)),
            Text(
              "Aviator Predictions",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSize(28),
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: heightSize(40)),
            const Spacer(),
            const LinearProgressIndicator(
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
