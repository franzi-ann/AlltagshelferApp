import 'package:flutter/material.dart';
import 'package:sustain/home.dart';
import 'package:sustain/lifestyle/alternate_products.dart';
import 'package:sustain/lifestyle/fashion_labels.dart';
import 'package:sustain/lifestyle/lifestyle_links.dart';
import 'package:sustain/localization_map.dart';
import 'package:sustain/places/regionals.dart';

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
        "/regionals": (ctx) => const Regionals(),
        "/markets": (ctx) => const LocationMap(1),
        "/farms": (ctx) => const LocationMap(2),
        "/fashion_links": (ctx) => const FashionLabels(),
        "/lifestyle":(context) => const LifeStyleLinks(),
        "/alternate":(context) => const AlternateProducts(),
      },
      home: const Home(),
    );
  }
}
