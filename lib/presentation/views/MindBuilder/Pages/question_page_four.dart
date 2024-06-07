import 'dart:developer';

import 'package:animal_connections_demo/core/Models/questions.dart';
import 'package:animal_connections_demo/core/Responsive/responsive.dart';
import 'package:animal_connections_demo/presentation/views/MindBuilder/Pages/question_five_page.dart';
import 'package:animal_connections_demo/presentation/views/MindBuilder/view%20model/question_one_page_vm.dart';
import 'package:animal_connections_demo/presentation/views/MindBuilder/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuestionPageFour extends ConsumerStatefulWidget {
  const QuestionPageFour({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _QuestionPageFourState();
}

class _QuestionPageFourState extends ConsumerState<QuestionPageFour> {
  final headerStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 30,
  );
  TextEditingController fourthQuestionController = TextEditingController();
  TextEditingController fifthQuestionController = TextEditingController();
  TextEditingController sixthQuestionController = TextEditingController();
  TextEditingController seventhQuestionController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fourthQuestionController.addListener(() {
      setState(() {
        final viewModel = ref.read(questionOnePageVM);
        viewModel.currentClassificationQuestionsMap.value.update(
          viewModel.currentClassificationChosen.value!.questionsList[2],
          (value) {
            return Answer(answerString: fourthQuestionController.text);
          },
        );
      });
    });
    fifthQuestionController.addListener(() {
      setState(() {
        final viewModel = ref.read(questionOnePageVM);
        viewModel.currentClassificationQuestionsMap.value.update(
          viewModel.currentClassificationChosen.value!.questionsList[3],
          (value) {
            return Answer(answerString: fifthQuestionController.text);
          },
        );
      });
    });
    sixthQuestionController.addListener(() {
      setState(() {
        final viewModel = ref.read(questionOnePageVM);
        viewModel.currentClassificationQuestionsMap.value.update(
          viewModel.currentClassificationChosen.value!.questionsList[4],
          (value) {
            return Answer(answerString: sixthQuestionController.text);
          },
        );
      });
    });
    seventhQuestionController.addListener(() {
      setState(() {
        final viewModel = ref.read(questionOnePageVM);
        viewModel.currentClassificationQuestionsMap.value.update(
          viewModel.currentClassificationChosen.value!.questionsList[5],
          (value) {
            return Answer(answerString: seventhQuestionController.text);
          },
        );
      });
    });
  }

  @override
  void dispose() {
    fourthQuestionController.dispose();
    fifthQuestionController.dispose();
    sixthQuestionController.dispose();
    seventhQuestionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final viewModel = ref.watch(questionOnePageVM);
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: "MindBuilder",
                    child: Material(
                      child: Center(
                        child: Text(
                          "MindBuilder",
                          style: headerStyle,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  const Text(
                    "4 of 9",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ValueListenableBuilder(
                    valueListenable: viewModel.currentClassificationChosen,
                    builder: (context, currentClassClassification, child) =>
                        CustomTextField(
                      title: currentClassClassification!
                          .questionsList[2].questionTitle,
                      controller: fourthQuestionController,
                      onChanged: (answer) {},
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.018,
                  ),
                  const Text(
                    "5 of 9",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ValueListenableBuilder(
                    valueListenable: viewModel.currentClassificationChosen,
                    builder: (context, currentClassClassification, child) =>
                        CustomTextField(
                      title: currentClassClassification!
                          .questionsList[3].questionTitle,
                      controller: fifthQuestionController,
                      onChanged: (answer) {},
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.018,
                  ),
                  const Text(
                    "6 of 9",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ValueListenableBuilder(
                    valueListenable: viewModel.currentClassificationChosen,
                    builder: (context, currentClassClassification, child) =>
                        CustomTextField(
                      title: currentClassClassification!
                          .questionsList[4].questionTitle,
                      controller: sixthQuestionController,
                      onChanged: (answer) {},
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.018,
                  ),
                  const Text(
                    "7 of 9",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ValueListenableBuilder(
                    valueListenable: viewModel.currentClassificationChosen,
                    builder: (context, currentClassClassification, child) =>
                        CustomTextField(
                      title: currentClassClassification!
                          .questionsList[5].questionTitle,
                      controller: seventhQuestionController,
                      onChanged: (answer) {},
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.12,
                  ),
                ],
              ),
            ),
          ),
          ValueListenableBuilder(
            valueListenable: viewModel.currentClassificationQuestionsMap,
            builder: (context, value, child) {
              return Align(
                alignment: const Alignment(-0.9, 0.9),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Ink(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 15),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 3,
                      ),
                    ),
                    child: const Text(
                      "Previous",
                    ),
                  ),
                ),
              );
            },
          ),
          Visibility(
            visible: fourthQuestionController.text.isNotEmpty &&
                fifthQuestionController.text.isNotEmpty &&
                sixthQuestionController.text.isNotEmpty &&
                seventhQuestionController.text.isNotEmpty,
            child: Align(
              alignment: const Alignment(0.9, 0.9),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuestionFivePage(),
                    ),
                  );
                },
                child: Ink(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 3,
                    ),
                  ),
                  child: const Text(
                    "Submit",
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
