import 'package:flutter/material.dart';
import 'package:proj1/data/task_inherited.dart';
// import 'package:proj1/pages/form_page.dart';
import 'package:proj1/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TaskInherited(child: const HomePage()),
    );
  }
}
