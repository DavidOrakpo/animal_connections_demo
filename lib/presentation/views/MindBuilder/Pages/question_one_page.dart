import 'package:animal_connections_demo/core/Enum/enums.dart';
import 'package:animal_connections_demo/core/Responsive/responsive.dart';
import 'package:animal_connections_demo/presentation/views/MindBuilder/Pages/question_two_page.dart';
import 'package:animal_connections_demo/presentation/views/MindBuilder/view%20model/question_one_page_vm.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuestionOnePage extends ConsumerStatefulWidget {
  const QuestionOnePage({super.key});

  @override
  ConsumerState<QuestionOnePage> createState() => _QuestionOnePageState();
}

class _QuestionOnePageState extends ConsumerState<QuestionOnePage>
    with TickerProviderStateMixin {
  final headerStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 30,
  );
  late AnimationController animationController;

  List<int> numberList = [1, 2, 3, 4, 5];

  int? selectedNumber;

  bool isExpanded = true;
  List<AgeClassification> listOfAgeClassifications = AgeClassification.values;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 250));
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
                children: [
                  Column(
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
                        height: size.height * 0.12,
                      ),
                      const Text(
                        "1 of 9",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      // ListView.builder(
                      //   itemCount: numberList.length,
                      //   shrinkWrap: true,
                      //   itemBuilder: (context, index) {
                      //     var item = numberList[index];
                      //     return RadioListTile(
                      //       groupValue: selectedNumber,
                      //       value: item,
                      //       title: Text("$item"),
                      //       onChanged: (value) {
                      //         setState(() {
                      //           selectedNumber = value;
                      //         });
                      //       },
                      //     );
                      //   },
                      // ),
                      // RadioListTile(
                      //   fillColor: MaterialStateColor.resolveWith(
                      //       (states) => Colors.white),
                      //   title: Text(
                      //     ageClass.identifier,
                      //     style: const TextStyle(
                      //       color: Colors.white,
                      //     ),
                      //   ),
                      //   onChanged: (value) {
                      //     viewModel.currentClassificationChosen.value = value;
                      //   },
                      // ),
                      Consumer(
                        builder: (context, ref, child) {
                          QuestionOnePageViewModel viewModel =
                              ref.watch(questionOnePageVM);
                          return ValueListenableBuilder(
                            valueListenable:
                                viewModel.currentClassificationChosen,
                            builder:
                                (context, currentClassificationChosen, child) {
                              return Container(
                                padding: const EdgeInsets.all(24),
                                width: Responsive.isDesktop(context)
                                    ? size.width * 0.5
                                    : size.width * 0.7,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Theme(
                                    data: Theme.of(context).copyWith(
                                        dividerColor: Colors.transparent),
                                    child: ExpansionTile(
                                      onExpansionChanged: (value) {
                                        setState(() {
                                          isExpanded = !isExpanded;
                                        });
                                      },
                                      expandedCrossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      expandedAlignment: Alignment.topLeft,
                                      trailing: Container(
                                        height: 50,
                                        width: 20,
                                        alignment: Alignment.center,
                                        child: Icon(
                                          isExpanded
                                              ? Icons.arrow_drop_down_outlined
                                              : Icons.arrow_drop_up_outlined,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      ),
                                      title: const Text(
                                        "How old are you?",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      children: listOfAgeClassifications
                                          .mapIndexed((index, ageClass) {
                                        return RadioListTile(
                                          value:
                                              AgeClassification.values[index],
                                          groupValue:
                                              currentClassificationChosen,
                                          fillColor:
                                              MaterialStateColor.resolveWith(
                                                  (states) => Colors.white),
                                          title: Text(
                                            ageClass.identifier,
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          onChanged: (value) {
                                            viewModel
                                                .currentClassificationChosen
                                                .value = value;
                                          },
                                        );
                                      }).toList(),
                                    )),
                              );
                            },
                          );
                        },
                      ),
                      SizedBox(
                        height: size.height * 0.1,
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
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: const Alignment(-0.9, 0.9),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const QuestionOnePage(),
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
                  "Previous",
                ),
              ),
            ),
          ),
          Consumer(
            builder: (context, ref, child) {
              return ValueListenableBuilder(
                valueListenable: viewModel.currentClassificationChosen,
                builder: (context, currentClassificationChosen, child) =>
                    Visibility(
                  visible: currentClassificationChosen != null,
                  child: Align(
                    alignment: const Alignment(0.9, 0.9),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const QuestionTwoPage(),
                          ),
                        );
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
                          "Submit",
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
