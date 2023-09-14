import 'package:animal_connections_demo/core/Responsive/responsive.dart';
import 'package:animal_connections_demo/presentation/views/LandingPage/widgets/blurred_container.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AnimalTile extends StatelessWidget {
  final String animalName;
  final String imagePath;
  final void Function()? onTap;
  final void Function(bool)? onHover;
  final double height, width;
  double imageHeight;
  Matrix4? transform;
  AnimalTile({
    super.key,
    required this.animalName,
    required this.imagePath,
    required this.onTap,
    required this.height,
    required this.width,
    required this.imageHeight,
    this.transform,
    required this.onHover,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onHover: onHover,
      child: BlurredContainer(
        height: height,
        width: width,
        transform: transform,
        child: Responsive.isMobile(context)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: Image.asset(
                      imagePath,
                      height: imageHeight,
                      // width: ,
                      // scale: 23,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: Text(
                      animalName,
                      style: const TextStyle(
                        color: Colors.white,
                        // fontSize: 20,
                      ),
                    ),
                  )
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    imagePath,
                    height: imageHeight,
                    // scale: 23,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    animalName,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
