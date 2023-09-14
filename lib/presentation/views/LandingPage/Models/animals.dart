// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

abstract class Animals {
  String? name;
  String? imagePath;
  // static bool canMove = false;
  Animals({
    this.name,
    this.imagePath,
  });
}

class Mammals extends Animals {
  Mammals({
    required String name,
    required String imagePath,
  }) : super(name: name, imagePath: imagePath);
}

class Reptiles extends Animals {
  Reptiles({
    required String name,
    required String imagePath,
  }) : super(name: name, imagePath: imagePath);
}

class Aves extends Animals {
  Aves({
    required String name,
    required String imagePath,
  }) : super(name: name, imagePath: imagePath);
}
