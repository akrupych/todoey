import 'package:flutter/material.dart';
import 'package:todoey/tasks_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TasksScreen(),
      theme: ThemeData.light().copyWith(
        canvasColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
