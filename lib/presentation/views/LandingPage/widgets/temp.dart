import 'package:flutter/material.dart';

class AnimalItem extends StatefulWidget {
  const AnimalItem({super.key});

  @override
  State<AnimalItem> createState() => _AnimalItemState();
}

class _AnimalItemState extends State<AnimalItem> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0.9, 0.65),
      child: Image.asset(
        "assets/images/reptile Background Removed.png",
        scale: 14,
      ),
    );
  }
}
