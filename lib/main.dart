import 'package:api_task_manager/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ApiTaskManager());
}

class ApiTaskManager extends StatefulWidget {
  const ApiTaskManager({super.key});

  @override
  State<ApiTaskManager> createState() => _ApiTaskManagerState();
}

class _ApiTaskManagerState extends State<ApiTaskManager> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: Scaffold(
        body: AddNewProduct(),
      ),
    );
  }
}
