import 'package:animal_connections_demo/core/Responsive/responsive.dart';
import 'package:animal_connections_demo/presentation/views/Components/custom_drop_down_menu.dart';
import 'package:animal_connections_demo/presentation/views/MindBuilder/Pages/question_one_page.dart';
import 'package:flutter/material.dart';

class MindBuilderFirstPage extends StatefulWidget {
  const MindBuilderFirstPage({super.key});

  @override
  State<MindBuilderFirstPage> createState() => _MindBuilderFirstPageState();
}

class _MindBuilderFirstPageState extends State<MindBuilderFirstPage> {
  final headerStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 30,
  );
  var backgroundColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: "MindBuilder",
                    child: Material(
                      child: Text(
                        "MindBuilder",
                        style: headerStyle,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Hero(
                    tag: "MindBuilderImage",
                    child: Container(
                      width: double.infinity,
                      color: Colors.yellow.shade50,
                      height: Responsive.isDesktop(context)
                          ? size.width * 0.3
                          : size.width * 0.35,
                      child: Image.asset(
                        "assets/images/mind_builder_icon.png",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  const FractionallySizedBox(
                    widthFactor: 0.8,
                    child: Text(
                      "Please answer each of the following questions to generate an amazingly cool 'about me' essay.\n\nSelect only the best answer for each question.\n\nPlease fill out our survey at the end to help us improve!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.08,
                  ),

                  // ExpansionTile(title: title),
                ],
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0.9, 0.9),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QuestionOnePage(),
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
                  "Start",
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
