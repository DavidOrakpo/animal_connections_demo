import 'dart:developer';

import 'package:animal_connections_demo/core/Models/questions.dart';
import 'package:animal_connections_demo/core/Responsive/responsive.dart';
import 'package:animal_connections_demo/presentation/views/MindBuilder/Pages/question_three_page.dart';
import 'package:animal_connections_demo/presentation/views/MindBuilder/view%20model/question_one_page_vm.dart';
import 'package:animal_connections_demo/presentation/views/MindBuilder/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:collection/collection.dart';

class QuestionTwoPage extends ConsumerStatefulWidget {
  const QuestionTwoPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _QuestionTwoPageState();
}

class _QuestionTwoPageState extends ConsumerState<QuestionTwoPage> {
  final headerStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 30,
  );
  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController.addListener(() {
      setState(() {});
    });
    final viewModel = ref.read(questionOnePageVM);
    viewModel.currentClassificationQuestionsMap.value = {
      for (var element
          in viewModel.currentClassificationChosen.value!.questionsList)
        element: Answer()
    };
    log(viewModel.currentClassificationQuestionsMap.value.toString());
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
                    "2 of 9",
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
                          .questionsList[0].questionTitle,
                      controller: nameController,
                      onChanged: (answer) {
                        viewModel.currentClassificationQuestionsMap.value
                            .update(
                          currentClassClassification.questionsList[0],
                          (value) {
                            return Answer(answerString: answer);
                          },
                        );

                        // var t = viewModel
                        //         .currentClassificationQuestionsMap.value[
                        //     currentClassClassification.questionsList[0]];

                        // // if (currentClassClassification.questionsList[3]) {

                        // // }
                        // log(viewModel
                        //     .currentClassificationQuestionsMap.value
                        //     .toString());
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
            visible: nameController.text.isNotEmpty,
            child: Align(
              alignment: const Alignment(0.9, 0.9),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuestionThreePage(),
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
