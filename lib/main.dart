import 'package:flutter/material.dart';
import 'package:sustain/home.dart';
import 'package:sustain/localization_map.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      initialRoute: "/home",
      routes: {
        "/home": (ctx) => const Home(),
        "/markets": (ctx) => const LocationMap(1),
        "/farms": (ctx) => const LocationMap(2),
      },
      home: const Home(),
    );
  }
}
