import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_animate/flutter_animate.dart';

class SecondScreenPage extends StatelessWidget {
  SecondScreenPage({super.key});

  var currentBackgroundColor = Colors.white;

  var currentBackgroundText = "White";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: currentBackgroundColor,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            //!First Layer
            //! CTRL + . brings up the context menu
            Positioned.fill(
              child: Image.asset(
                "assets/images/jungle_two.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: const Alignment(0.9, 0.65),
              child: Image.asset(
                "assets/images/reptile Background Removed.png",
                scale: 14,
              ),
            ),
            Align(
              alignment: const Alignment(-0.9, -0.5),
              child: Transform.rotate(
                angle: -pi / 40,
                child: Image.asset(
                  "assets/images/second_slide/monkey_one.png",
                  scale: 2.5,
                ),
              ),
            ),
            Align(
              alignment: const Alignment(-0.3, 0.4),
              child: Image.asset(
                "assets/images/second_slide/lion.png",
                scale: 1.5,
              ),
            ),
            Align(
              alignment: const Alignment(0.5, 0.4),
              child: Image.asset(
                "assets/images/second_slide/deer_two.png",
                scale: 3,
              ),
            ),
            Align(
              alignment: const Alignment(0, -0.7),
              child: Image.asset(
                "assets/images/second_slide/bat.png",
                scale: 3,
              ),
            ),
            Align(
              alignment: const Alignment(0.3, -0.4),
              child: Image.asset(
                "assets/images/second_slide/bat.png",
                scale: 5,
              ),
            ),
            // Align(
            //   alignment: const Alignment(0, -0.7),
            //   child: Image.asset(
            //     "assets/images/second_slide/bat.png",
            //     scale: 3,
            //   ),
            // )
          ].animate(interval: 500.ms).fade(),
        ),
      ),
    );
  }
}
