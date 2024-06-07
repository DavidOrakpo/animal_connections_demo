// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Question {
  final String questionTitle;

  const Question({
    required this.questionTitle,
  });

  @override
  String toString() => 'Question(questionTitle: $questionTitle)';

  @override
  bool operator ==(covariant Question other) {
    if (identical(this, other)) return true;

    return other.questionTitle == questionTitle;
  }

  @override
  int get hashCode => questionTitle.hashCode;
}

class Answer {
  String? answerString;
  bool? isEmpty;

  Answer({
    this.answerString,
  }) : isEmpty = answerString == null || answerString.isEmpty;

  @override
  String toString() => 'Answer(answerString: $answerString)';

  @override
  bool operator ==(covariant Answer other) {
    if (identical(this, other)) return true;

    return other.answerString == answerString;
  }

  @override
  int get hashCode => answerString.hashCode;
}
