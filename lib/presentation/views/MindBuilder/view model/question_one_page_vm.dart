import 'package:animal_connections_demo/core/Enum/enums.dart';
import 'package:animal_connections_demo/core/Models/questions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final questionOnePageVM = ChangeNotifierProvider.autoDispose(
  (ref) => QuestionOnePageViewModel(),
);

class QuestionOnePageViewModel extends ChangeNotifier {
  ValueNotifier<AgeClassification?> currentClassificationChosen =
      ValueNotifier(null);

  // Map<Question, Answer> currentAskedQuestion = {};
  ValueNotifier<Map<Question, Answer>> currentClassificationQuestionsMap =
      ValueNotifier({});
  // ValueNotifier<AgeClassification?> currentClassificationChosen =
  //     ValueNotifier(null);

  //! ValueListenableBuilder == ValueNotifier == Consumer => State Management
  //!

  // bool isActive() {
  //   notifyListeners();
  //   return true;
  // }
}

// abstract class Animal {
//   void moveFoward();
// }

// class Monkey extends Animal {
//   @override
//   void moveFoward() {
//     print("Swings on Vines");
//   }
// }

// class Snake extends Animal {
//   @override
//   void moveFoward() {
//     print("Slithers on the ground");
//   }
// }
