import 'package:flutter/material.dart';
import 'package:dev_webtoon/screens/home_screen.dart';
import 'package:dev_webtoon/services/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}