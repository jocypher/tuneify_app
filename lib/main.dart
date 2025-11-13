import 'package:flutter/material.dart';
import 'package:tuneify_app/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tuneify',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}