import 'package:animal_connections_demo/presentation/views/LandingPage/pages/landing_page.dart';
import 'package:animal_connections_demo/presentation/views/MindBuilder/Pages/landing_page_mbuilder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        textTheme: GoogleFonts.pressStart2pTextTheme(),
        useMaterial3: true,
      ),
      home: const LandingPage(),
    );
  }
}
