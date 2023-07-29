import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app.dart';

void main() async {
  await dotenv.load();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Haiku Generator Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HaikuPage(title: 'Haiku generator for Google products'),
    );
  }
}
