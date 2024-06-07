import 'dart:developer';

import 'package:animal_connections_demo/presentation/views/LandingPage/widgets/blurred_container.dart';
import 'package:flutter/material.dart';

class AnimalItem extends StatefulWidget {
  final String imageName;
  double? scale;
  AlignmentGeometry imageAlignment;
  AnimalItem({
    super.key,
    required this.imageName,
    required this.imageAlignment,
    this.scale = 3,
  });

  @override
  State<AnimalItem> createState() => _AnimalItemState();
}

class _AnimalItemState extends State<AnimalItem> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    debugPrint("Image Name in Build ${widget.imageName}");

    return Align(
      alignment: widget.imageAlignment,
      child: MouseRegion(
        cursor: SystemMouseCursors.zoomIn,
        child: InkWell(
          onHover: (onHovered) async {
            // debugPrint("Hovered");
            var offsetX = widget.imageAlignment.resolve(TextDirection.ltr).x *
                    size.width /
                    2 +
                size.width / 2;
            var offsetY = widget.imageAlignment.resolve(TextDirection.ltr).y *
                    size.height /
                    2 +
                size.height / 2;
            // debugPrint("$offsetX : $offsetY");
            await showGeneralDialog(
              context: context,
              barrierDismissible: true,
              anchorPoint: Offset(offsetX, offsetY),
              barrierLabel: "",
              pageBuilder: (context, animation, animation2) {
                return Container();
              },
              transitionDuration: const Duration(milliseconds: 300),
              transitionBuilder:
                  (context, animation, secondaryAnimation, child) {
                var curve = Curves.easeInOut.transform(animation.value);
                return Transform.scale(
                  scale: curve,
                  child: Dialog(
                    backgroundColor: Colors.transparent,
                    surfaceTintColor: Colors.transparent,
                    child: Align(
                      alignment: widget.imageAlignment,
                      child: MouseRegion(
                        onExit: (event) {
                          debugPrint("Exited Popup");
                          Navigator.pop(context);
                        },
                        child: BlurredContainer(
                          height: size.height * 0.45,

                          width: size.width * 0.5,
                          // color: Colors.green,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Image.asset(
                                  widget.imageName,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  color: Colors.purple,
                                  child: Text(
                                    "Test",
                                    style: TextStyle(),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ).then((value) {
              if (onHovered == false) {
                Navigator.pop(context);
              }
            });
          },
          onTap: () async {
            // debugPrint("Hovered");
            // await showDialog(
            //   context: context,
            //   builder: (context) {
            //     return Center(
            //       child: BlurredContainer(
            //         height: size.height * 0.45,

            //         width: size.width * 0.5,
            //         // color: Colors.green,
            //         child: Row(
            //           children: [
            //             Expanded(
            //               flex: 2,
            //               child: Image.asset(
            //                 widget.imageName,
            //               ),
            //             ),
            //             Expanded(
            //               child: Container(
            //                 color: Colors.red,
            //                 child: Text("Test"),
            //               ),
            //             )
            //           ],
            //         ),
            //       ),
            //     );
            //   },
            // );
            // // .then((value) {
            // //   if (onHovered == false) {
            // //     Navigator.pop(context);
            // //   }
            // // });
          },
          child: Image.asset(
            widget.imageName,
            scale: widget.scale,
          ),
        ),
      ),
    );
  }
}
