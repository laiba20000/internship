import 'package:flutter/material.dart';
import 'package:internship/task-2/contact_screen.dart';
import 'package:internship/task-2/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      home: StartScreen()
    );
  }
}



