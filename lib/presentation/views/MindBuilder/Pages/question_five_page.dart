import 'package:animal_connections_demo/core/Models/questions.dart';
import 'package:animal_connections_demo/presentation/views/MindBuilder/view%20model/question_one_page_vm.dart';
import 'package:animal_connections_demo/presentation/views/MindBuilder/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuestionFivePage extends ConsumerStatefulWidget {
  const QuestionFivePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _QuestionFivePageState();
}

class _QuestionFivePageState extends ConsumerState<QuestionFivePage> {
  final headerStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 30,
  );
  TextEditingController eigthQuestionController = TextEditingController();
  TextEditingController ningthQuestionController = TextEditingController();

  @override
  void dispose() {
    eigthQuestionController.dispose();
    ningthQuestionController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    eigthQuestionController.addListener(() {
      setState(() {
        final viewModel = ref.read(questionOnePageVM);
        viewModel.currentClassificationQuestionsMap.value.update(
          viewModel.currentClassificationChosen.value!.questionsList[6],
          (value) {
            return Answer(answerString: eigthQuestionController.text);
          },
        );
      });
    });
    ningthQuestionController.addListener(() {
      setState(() {
        final viewModel = ref.read(questionOnePageVM);
        viewModel.currentClassificationQuestionsMap.value.update(
          viewModel.currentClassificationChosen.value!.questionsList[7],
          (value) {
            return Answer(answerString: ningthQuestionController.text);
          },
        );
      });
    });
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
                    "8 of 9",
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
                          .questionsList[6].questionTitle,
                      controller: eigthQuestionController,
                      onChanged: (answer) {},
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.018,
                  ),
                  const Text(
                    "9 of 9",
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
                          .questionsList[7].questionTitle,
                      controller: ningthQuestionController,
                      onChanged: (answer) {},
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.018,
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
            visible: eigthQuestionController.text.isNotEmpty &&
                ningthQuestionController.text.isNotEmpty,
            child: Align(
              alignment: const Alignment(0.9, 0.9),
              child: InkWell(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const QuestionTwoPage(),
                  //   ),
                  // );
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
