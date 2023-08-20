import 'package:flutter/material.dart';
import 'package:newapp1/counter.dart';
import 'package:newapp1/todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ToDoView(),
    );
  }
}
