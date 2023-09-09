import 'package:animal_connections_demo/core/Responsive/responsive.dart';
import 'package:animal_connections_demo/presentation/views/Components/selectable_item.dart';
import 'package:animal_connections_demo/presentation/views/LandingPage/Models/animals.dart';
import 'package:animal_connections_demo/presentation/views/LandingPage/widgets/animal_tile.dart';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  AudioPlayer audioPlayer = AudioPlayer();
  List<Animals> listOfAnimals = <Animals>[
    Mammals(
        name: "Mammals",
        imagePath: "assets/images/mammal Background Removed.png"),
    Reptiles(
        name: "Reptiles",
        imagePath: "assets/images/reptile Background Removed.png"),
    Aves(name: "Aves", imagePath: "assets/images/aves Background Removed.png"),
  ];

  var selectableListOfAnimals = <SelectableItems<Animals>>[];

  @override
  void initState() {
    super.initState();

    selectableListOfAnimals =
        listOfAnimals.map((animalData) => SelectableItems(animalData)).toList();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await audioPlayer.setAsset("assets/audio/jungle.mp3");
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          //! Bottom of the stack
          Positioned.fill(
            child: Image.asset(
              "assets/images/junle_one.jpg",
              fit: BoxFit.cover,
            ),
          ),
          //! First Layer
          Align(
            alignment: const Alignment(0, -1),
            child: Container(
              height: size.height * 0.15,
              width: size.width * 0.4,
              // padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 13, 80, 16),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      blurRadius: 10,
                      spreadRadius: 15,
                    )
                  ]),
              child: Center(
                child: Text(
                  "Animal Connection",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: switch (size.width) {
                      _ when Responsive.isDesktop(context) => 25,
                      _ when Responsive.isMobile(context) => 18,
                      _ when Responsive.isTablet(context) => 20,
                      _ => 25,
                    },
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          //! Third Layer
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: size.height * 0.5,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: selectableListOfAnimals.map((e) {
                        return AnimalTile(
                          animalName: e.data.name!,
                          imagePath: e.data.imagePath!,
                          onTap: () {},
                          height: constraints.maxHeight * 0.9,
                          transform: e.isSelected
                              ? (Matrix4.identity()
                                ..scale(
                                  1.05,
                                  1.05,
                                  // 1.05,
                                ))
                              : Matrix4.identity(),
                          width: size.width * 0.24,
                          imageHeight: (constraints.maxHeight * 0.9) * 0.75,
                          onHover: (value) {
                            audioPlayer.playerStateStream.listen(
                              (event) async {
                                if (event.playing) {
                                  return;
                                }
                                // await audioPlayer.play();
                                // await audioPlayer.setLoopMode(LoopMode.one);
                                // await audioPlayer.setVolume(0.3);
                              },
                            );
                            setState(() {
                              e.isSelected = value;
                            });
                          },
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}