// ignore_for_file: constant_identifier_names

import 'package:animal_connections_demo/core/Models/questions.dart';
import 'package:flutter/material.dart';

enum AgeClassification {
  BelowEightYears(
    numberOfInterests: 3,
    identifier: "Less than 8",
    questionsList: [
      Question(
        questionTitle: "What is your name?",
      ),
      Question(
        questionTitle: "What is your favorite color?",
      ),
      Question(
        questionTitle:
            "What is your favorite place you have visited or want to visit?",
      ),
      Question(
        questionTitle: "What are 1 - 2 of your favourite things to do for fun?",
      ),
      Question(
        questionTitle: "What are 1 - 2 favorite things to learn about?",
      ),
      Question(
        questionTitle: "What is something you're the most proud of?",
      ),
      Question(
        questionTitle:
            "What is the hardest thing for you to do or learn about?",
      ),
      Question(
        questionTitle: "Who is your biggest hero?",
      ),
      Question(
        questionTitle: "What makes someone a good friend?",
      ),
    ],
  ),

  NineToTwelve(
    numberOfInterests: 4,
    identifier: "9 - 12",
    questionsList: [
      Question(
        questionTitle: "What is your name?",
      ),
      Question(
        questionTitle:
            "What is the best place you have ever visited, or would like to visit?",
      ),
      Question(
        questionTitle:
            "What are 2 - 3 activities you could spend all day doing without getting bored?",
      ),
      Question(
        questionTitle:
            "What are 2 - 3 topics you enjoy learning the most about?",
      ),
      Question(
        questionTitle:
            "What are 1 or 2 things you have achieved that you are the most proud of?",
      ),
      Question(
        questionTitle:
            "Is there a book or story that you love or think about often? Why do you like it?",
      ),
      Question(
        questionTitle: "Who is your biggest hero and why?",
      ),
      Question(
        questionTitle: "What 2 traits makes a good friend?",
      ),
      Question(
        questionTitle:
            "What is something you want to get really good at in the future?",
      ),
    ],
  ),
  ThirteenToSeventeen(
    numberOfInterests: 5,
    identifier: "13 - 17",
    questionsList: [
      Question(
        questionTitle: "What is your name?",
      ),
      Question(
        questionTitle:
            "What are 2 - 3 activities or hobbies you could spend all day doing without getting bored?",
      ),
      Question(
        questionTitle:
            "Which 2 - 3 subject areas align the most with your interests?",
      ),
      Question(
        questionTitle:
            "What are 1 - 2 personal achievements that you're the most proud of?",
      ),
      Question(
        questionTitle:
            "What is something you have recently learned about yourself that surprised you?",
      ),
      Question(
        questionTitle:
            "What is the biggest challenge you have had to overcome and how did you do it?",
      ),
      Question(
        questionTitle:
            "What role model or hero has had the biggest impact on you and why?",
      ),
      Question(
        questionTitle: "What are 3 characteristics that make a great friend?",
      ),
      Question(
        questionTitle:
            "If you could achieve one goal over the next 2 - 3 years, what would it be?",
      ),
    ],
  ),
  EighteenAbove(
    numberOfInterests: 8,
    identifier: "18+",
    questionsList: [
      Question(
        questionTitle: "What is your name?",
      ),
      Question(
        questionTitle: "What are 2 - 3 hobbies you are most passionate about?",
      ),
      Question(
        questionTitle:
            "What are 2 - 3 personal achievements that you're the most proud of?",
      ),
      Question(
        questionTitle: "What are 2 - 3 guiding principles that you live by?",
      ),
      Question(
        questionTitle:
            "What is the biggest personal obstacle you have ever had to overcome and how did you do it?",
      ),
      Question(
        questionTitle:
            "What are 3 characteristics that you value most in a close friend or partner?",
      ),
      Question(
        questionTitle:
            "Who has had the mnost profound impact in your life and why?",
      ),
      Question(
        questionTitle:
            "What event or movement in your life had the biggest impact on shaping who you are today?",
      ),
      Question(
        questionTitle:
            "What area of your life are you most focuserd on improving for the foreseeable future?",
      ),
    ],
  );

  const AgeClassification({
    required this.numberOfInterests,
    required this.identifier,
    required this.questionsList,
  });

  final int numberOfInterests;
  final String identifier;
  final List<Question> questionsList;
}
//!MVVM
//! Model, View, View-Model == State Management
