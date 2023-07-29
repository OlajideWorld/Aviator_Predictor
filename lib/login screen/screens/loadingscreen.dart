import 'package:aviatorpredict/utils/sizes.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  LoadingScreen({super.key});

  Color redColor = const Color(0xFFE40639);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: heightSize(50),
          width: widthSize(50),
          child: CircularProgressIndicator(
            color: redColor,
            strokeWidth: 7,
          ),
        ),
      ),
    );
  }
}
