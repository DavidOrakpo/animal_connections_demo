import 'package:animal_connections_demo/presentation/views/LandingPage/widgets/animal_item.dart';
import 'package:animal_connections_demo/presentation/views/LandingPage/widgets/blurred_container.dart';
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
                fit: BoxFit.fill,
              ),
            ),
            AnimalItem(
              key: UniqueKey(),
              imageName: "assets/images/reptile Background Removed.png",
              imageAlignment: const Alignment(0.9, 0.65),
              scale: 14,
            ),
            Align(
              alignment: const Alignment(-0.9, -0.5),
              child: Transform.rotate(
                angle: -pi / 40,
                child: MouseRegion(
                  cursor: SystemMouseCursors.zoomIn,
                  child: Image.asset(
                    "assets/images/second_slide/monkey_one.png",
                    scale: 2.5,
                  ),
                ),
              ),
            ),
            AnimalItem(
              imageName: "assets/images/second_slide/lion.png",
              imageAlignment: const Alignment(-0.3, 0.4),
            ),
            AnimalItem(
              imageName: "assets/images/second_slide/deer_two.png",
              imageAlignment: const Alignment(0.5, 0.4),
            ),
            AnimalItem(
              imageName: "assets/images/second_slide/bat.png",
              imageAlignment: const Alignment(0, -0.7),
            ),
            AnimalItem(
              imageName: "assets/images/second_slide/bat.png",
              imageAlignment: const Alignment(0.3, -0.4),
            ),
          ].animate(interval: 500.ms).fade(),
        ),
      ),
    );
  }
}
