import 'dart:developer';

import 'package:animal_connections_demo/core/Models/questions.dart';
import 'package:animal_connections_demo/core/Responsive/responsive.dart';
import 'package:animal_connections_demo/presentation/views/MindBuilder/Pages/question_page_four.dart';
import 'package:animal_connections_demo/presentation/views/MindBuilder/view%20model/question_one_page_vm.dart';
import 'package:animal_connections_demo/presentation/views/MindBuilder/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuestionThreePage extends ConsumerStatefulWidget {
  const QuestionThreePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _QuestionThreePageState();
}

class _QuestionThreePageState extends ConsumerState<QuestionThreePage> {
  final headerStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 30,
  );
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      setState(() {
        final viewModel = ref.read(questionOnePageVM);
        viewModel.currentClassificationQuestionsMap.value.update(
          viewModel.currentClassificationChosen.value!.questionsList[1],
          (value) {
            return Answer(answerString: controller.text);
          },
        );
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
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
                    height: size.height * 0.1,
                  ),
                  const Text(
                    "3 of 9",
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
                          .questionsList[1].questionTitle,
                      controller: controller,
                      onChanged: (answer) {
                        log(viewModel.currentClassificationQuestionsMap.value
                            .toString());
                        // viewModel.currentClassificationQuestionsMap.value
                        //     .update(
                        //   currentClassClassification.questionsList[1],
                        //   (value) {
                        //     return Answer(answerString: answer);
                        //   },
                        // );
                      },
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.12,
                  ),
                  Hero(
                    tag: "MindBuilderImage",
                    child: Container(
                      width: size.width * 0.7,
                      color: const Color.fromRGBO(255, 253, 231, 1),
                      height: Responsive.isDesktop(context)
                          ? size.width * 0.25
                          : size.width * 0.35,
                      child: Image.asset(
                        "assets/images/mind_builder_icon.png",
                      ),
                    ),
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
            visible: controller.text.isNotEmpty,
            child: Align(
              alignment: const Alignment(0.9, 0.9),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuestionPageFour(),
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
