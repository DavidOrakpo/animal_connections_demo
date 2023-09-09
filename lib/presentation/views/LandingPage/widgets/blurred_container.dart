import 'dart:ui';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BlurredContainer extends StatelessWidget {
  BlurredContainer({
    Key? key,
    this.height,
    this.width,
    this.backgroundColor,
    this.sigmaX,
    this.sigmaY,
    this.transform,
    this.padding,
    this.child,
  }) : super(key: key);
  double? height, width, sigmaX, sigmaY;
  Color? backgroundColor;
  EdgeInsets? padding;
  Duration? duration;
  Matrix4? transform;
  Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: AnimatedContainer(
        duration: duration ?? const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.black.withOpacity(0.3), width: 2),
        ),
        // padding:
        //     padding ?? const EdgeInsets.symmetric(horizontal: 14, vertical: 32),
        height: height,
        transform: transform,
        transformAlignment: Alignment.center,
        width: width,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: sigmaX ?? 4.0, sigmaY: sigmaY ?? 4.0),
              child: Container(),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(0.15),
                      Colors.white.withOpacity(0.05)
                    ],
                  )),
              // child: child,
            ),
            Center(child: child)
          ],
        ),
      ),
    );
  }
}
